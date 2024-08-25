import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nooh/domain/model/matches_model.dart';

class MatchController extends GetxController {
  var isLoading = true.obs;
  var matches = Matches().obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchMatches();
  }

  void fetchMatches() async {
    try {
      isLoading(true);
      var response = await _dio.get('https://nooh.live/api/match/getMatches');

      if (response.statusCode == 200) {
        matches.value = Matches.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to load matches');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}
