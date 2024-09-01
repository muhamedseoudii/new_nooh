import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nooh/domain/model/matches_details_model.dart';

class MatchDetailsController extends GetxController {
  var isLoading = true.obs;
  var matchDetails = MatchesDetails().obs;
  var selectedUrl = ''.obs;
  VideoPlayerController? videoPlayerController;
  CustomVideoPlayerController? customVideoPlayerController;
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
          initializeVideoPlayer(selectedUrl.value);
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

  void initializeVideoPlayer(String url) async {
    isVideoLoading(true);
    videoPlayerController?.dispose();
    customVideoPlayerController?.dispose();

    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    await videoPlayerController!.initialize();
    customVideoPlayerController = CustomVideoPlayerController(
      context: Get.context!,
      videoPlayerController: videoPlayerController!,
    );
    isVideoLoading(false);
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    customVideoPlayerController?.dispose();
    super.onClose();
  }
}

// class MatchDetailsController extends GetxController {
//   var isLoading = true.obs;
//   var matchDetails = MatchesDetails().obs;
//   var selectedUrl = ''.obs;
//   VideoPlayerController? videoPlayerController;
//   CustomVideoPlayerController? customVideoPlayerController;
//   var isVideoLoading = true.obs;
//
//   final Dio _dio = Dio();
//
//   void fetchMatchesDetails(String id) async {
//     try {
//       isLoading(true);
//       var response = await _dio.get(
//         'https://nooh.live/api/match/getOneMatch',
//         data: {"_id": id},
//       );
//       if (response.statusCode == 200) {
//         matchDetails.value = MatchesDetails.fromJson(response.data);
//         if (matchDetails.value.data != null &&
//             matchDetails.value.data!.streamUrl!.isNotEmpty) {
//           selectedUrl.value = matchDetails.value.data!.streamUrl![0];
//           // initializeVideoPlayer(selectedUrl.value);
//         }
//       } else {
//         Get.snackbar('Error', 'Failed to load matches');
//       }
//     } catch (e, st) {
//       print('Error occurred: $e');
//       print('ST Error occurred: $st');
//     } finally {
//       isLoading(false);
//     }
//   }

// void initializeVideoPlayer(String url) {
//   isVideoLoading(true);
//
//   // disposeVideoPlayer(); // Ensure the old controller is disposed
//
//   videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url))
//     ..initialize().then((_) {
//       customVideoPlayerController = CustomVideoPlayerController(
//         context: Get.context!,
//         videoPlayerController: videoPlayerController!,
//       );
//       isVideoLoading(false);
//     });
// }
//
// void disposeVideoPlayer() {
//   videoPlayerController?.dispose();
//   customVideoPlayerController?.dispose();
//   videoPlayerController = null;
//   customVideoPlayerController = null;
// }
//
// @override
// void dispose() {
//   customVideoPlayerController?.dispose();
//   super.dispose();
// }
//
// @override
// void onClose() {
//   disposeVideoPlayer();
//   super.onClose();
// }
// }

//Better Player

// class MatchDetailsController extends GetxController {
//   var isLoading = true.obs;
//   var matchDetails = MatchesDetails().obs;
//   var selectedUrl = ''.obs;
//   BetterPlayerController? betterPlayerController;
//   var isVideoLoading = true.obs;
//
//   final Dio _dio = Dio();
//
//   void fetchMatchesDetails(String id) async {
//     try {
//       isLoading(true);
//       var response = await _dio.get(
//         'https://nooh.live/api/match/getOneMatch',
//         data: {"_id": id},
//       );
//       if (response.statusCode == 200) {
//         matchDetails.value = MatchesDetails.fromJson(response.data);
//         if (matchDetails.value.data != null &&
//             matchDetails.value.data!.streamUrl!.isNotEmpty) {
//           selectedUrl.value = matchDetails.value.data!.streamUrl![0];
//           initializeBetterPlayer(selectedUrl.value);
//         }
//       } else {
//         Get.snackbar('Error', 'Failed to load matches');
//       }
//     } catch (e, st) {
//       print('Error occurred: $e');
//       print('ST Error occurred: $st');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void initializeBetterPlayer(String url) {
//     isVideoLoading(true); // Show loading indicator until video is ready
//     disposeBetterPlayer(); // Ensure the old controller is disposed
//
//     BetterPlayerDataSource dataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       url,
//     );
//
//     betterPlayerController = BetterPlayerController(
//       BetterPlayerConfiguration(
//         autoPlay: true,
//         aspectRatio: 16 / 9,
//         handleLifecycle: true,
//         fullScreenByDefault: false,
//         allowedScreenSleep: false,
//         autoDetectFullscreenDeviceOrientation: true,
//         controlsConfiguration:
//             BetterPlayerControlsConfiguration(enableSubtitles: false),
//       ),
//       betterPlayerDataSource: dataSource,
//     );
//
//     betterPlayerController?.addEventsListener((event) {
//       if (event.betterPlayerEventType == BetterPlayerEventType.play) {
//         isVideoLoading(
//             false); // Hide loading indicator once video starts playing
//       }
//     });
//   }
//
//   void disposeBetterPlayer() {
//     betterPlayerController?.pause();
//     betterPlayerController?.dispose();
//     betterPlayerController = null;
//   }
//
//   @override
//   void onClose() {
//     disposeBetterPlayer();
//     super.onClose();
//   }
// }

// Flick Player

// //class MatchDetailsController extends GetxController {
// //   var isLoading = true.obs;
// //   var matchDetails = MatchesDetails().obs;
// //   var selectedUrl = ''.obs;
// //   FlickManager? flickManager;
// //   var isVideoLoading = true.obs;
// //
// //   final Dio _dio = Dio();
// //
// //   void fetchMatchesDetails(String id) async {
// //     try {
// //       isLoading(true);
// //       var response = await _dio.get(
// //         'https://nooh.live/api/match/getOneMatch',
// //         data: {"_id": id},
// //       );
// //       if (response.statusCode == 200) {
// //         matchDetails.value = MatchesDetails.fromJson(response.data);
// //         if (matchDetails.value.data != null &&
// //             matchDetails.value.data!.streamUrl!.isNotEmpty) {
// //           selectedUrl.value = matchDetails.value.data!.streamUrl![0];
// //           initializeFlickPlayer(selectedUrl.value);
// //         }
// //       } else {
// //         Get.snackbar('Error', 'Failed to load matches');
// //       }
// //     } catch (e, st) {
// //       print('Error occurred: $e');
// //       print('ST Error occurred: $st');
// //     } finally {
// //       isLoading(false);
// //     }
// //   }
// //
// //   void initializeFlickPlayer(String url) async {
// //     isVideoLoading(true);
// //
// //     // Dispose of any previous instances safely
// //     disposeFlickPlayer();
// //
// //     try {
// //       flickManager = FlickManager(
// //         videoPlayerController: VideoPlayerController.network(url),
// //       );
// //
// //       await flickManager?.flickVideoManager?.videoPlayerController
// //           ?.initialize();
// //       flickManager?.flickVideoManager?.videoPlayerController?.play();
// //
// //       // Update the loading state after initializing the video
// //       isVideoLoading(false);
// //     } catch (e) {
// //       print('Error initializing video: $e');
// //       // Ensure loading state is updated even if an error occurs
// //       isVideoLoading(false);
// //     }
// //   }
// //
// //   void disposeFlickPlayer() {
// //     if (flickManager
// //             ?.flickVideoManager?.videoPlayerController?.value.isInitialized ??
// //         false) {
// //       flickManager?.flickVideoManager?.videoPlayerController?.pause();
// //       flickManager?.flickVideoManager?.videoPlayerController?.dispose();
// //     }
// //     flickManager?.dispose();
// //     flickManager = null;
// //   }
// //
// //   @override
// //   void onClose() {
// //     disposeFlickPlayer();
// //     super.onClose();
// //   }
// // }
