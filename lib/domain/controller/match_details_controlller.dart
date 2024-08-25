import 'package:better_player/better_player.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nooh/domain/model/matches_details_model.dart';

class MatchDetailsController extends GetxController {
  var isLoading = true.obs;
  var matchDetails = MatchesDetails().obs;
  var selectedUrl = ''.obs;
  BetterPlayerController? betterPlayerController;
  var isVideoLoading = true.obs;

  final Dio _dio = Dio();

  void fetchMatchesDetails(String id) async {
    try {
      isLoading(true);
      var response = await _dio.get(
        'https://nooh.live/api/match/getOneMatch',
        data: {"_id": id},
      );
      if (response.statusCode == 200) {
        matchDetails.value = MatchesDetails.fromJson(response.data);
        if (matchDetails.value.data != null &&
            matchDetails.value.data!.streamUrl!.isNotEmpty) {
          selectedUrl.value = matchDetails.value.data!.streamUrl![0];
          initializeBetterPlayer(selectedUrl.value);
        }
      } else {
        Get.snackbar('Error', 'Failed to load matches');
      }
    } catch (e, st) {
      print('Error occurred: $e');
      print('ST Error occurred: $st');
    } finally {
      isLoading(false);
    }
  }

  void initializeBetterPlayer(String url) {
    isVideoLoading(true); // Show loading indicator until video is ready
    disposeBetterPlayer(); // Ensure the old controller is disposed

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      url,
    );

    betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: true,

        aspectRatio: 16 / 9,
        handleLifecycle: false, // Disable lifecycle handling
        fullScreenByDefault: false,
        allowedScreenSleep: false,
        autoDetectFullscreenDeviceOrientation: true,
      ),
      betterPlayerDataSource: dataSource,
    );

    betterPlayerController?.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.play) {
        isVideoLoading(
            false); // Hide loading indicator once video starts playing
      }
    });
  }

  void disposeBetterPlayer() {
    betterPlayerController?.pause();
    betterPlayerController?.dispose();
    betterPlayerController = null;
  }

  @override
  void onClose() {
    disposeBetterPlayer();
    super.onClose();
  }
}
