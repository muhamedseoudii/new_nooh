import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nooh/domain/model/trending_series_model.dart';

class SeriesController extends GetxController {
  var isLoading = true.obs;
  var trendingSeriesList = <Series>[].obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchTrendingSeries();
    super.onInit();
  }

  void fetchTrendingSeries() async {
    try {
      isLoading(true);
      final response =
          await _dio.get("https://nooh.live/api/series/getTrendingSeries");

      if (response.statusCode == 200) {
        var seriesData = TrendingSeries.fromJson(response.data);
        if (seriesData.data != null && seriesData.status == "true") {
          trendingSeriesList.assignAll(seriesData.data!);
        }
      } else {
        print("Failed to load trending series: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    } finally {
      isLoading(false);
    }
  }
}
