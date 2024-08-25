import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/all_series_model.dart';

class AllSeriesController extends GetxController {
  var isLoading = true.obs;
  var allSeries = AllSeries().obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchAllSeries();
    super.onInit();
  }

  void fetchAllSeries() async {
    try {
      isLoading(true);
      final response = await _dio.get("https://nooh.live/api/series/getSeries");

      if (response.statusCode == 200) {
        allSeries.value = AllSeries.fromJson(response.data);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e, st) {
      print('Error: $e');
      print('Error st: $st');
    } finally {
      isLoading(false);
    }
  }
}
