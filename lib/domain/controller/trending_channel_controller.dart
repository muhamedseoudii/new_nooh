import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/trending_channel_model.dart';

class TrendingChannelController extends GetxController {
  var isLoading = true.obs;
  var trendingChannels = <Channel>[].obs;
  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchTrendingChannels();
    super.onInit();
  }

  Future<void> fetchTrendingChannels() async {
    try {
      isLoading(true);
      final response =
          await _dio.get('https://nooh.live/api/chaneel/getTrendingChannel');

      if (response.statusCode == 200) {
        final trendingChannel = TrendingChannel.fromJson(response.data);
        if (trendingChannel.status == "true") {
          trendingChannels.value = trendingChannel.data ?? [];
        } else {
          Get.snackbar("Error", "Failed to load trending channels");
        }
      } else {
        Get.snackbar("Error", "Failed to load trending channels");
      }
    } catch (e) {
      Get.snackbar("Error occurred", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
