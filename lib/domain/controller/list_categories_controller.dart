import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/channel_category_model.dart';
import 'package:nooh/domain/model/movie_category_model.dart';
import 'package:nooh/domain/model/series_category_model.dart';

class ListCategoryController extends GetxController {
  var isLoading = true.obs;
  var isLoading1 = true.obs;
  var isLoading2 = true.obs;
  var movieCategory = MovieCategory().obs;
  var seriesCategory = SeriesCategory().obs;
  var channelCategory = ChannelCategoryModel().obs;

  final Dio _dio = Dio();

  void fetchMovieCategory(String id) async {
    try {
      isLoading(true);
      final response = await _dio
          .get("https://nooh.live/api/movie/getMoviesByCategory", data: {
        "category": id,
      });

      if (response.statusCode == 200) {
        movieCategory.value = MovieCategory.fromJson(response.data);
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

  void fetchCategorySeries(String id) async {
    try {
      isLoading1(true);
      final response = await _dio
          .get("https://nooh.live/api/series/getSeriesByCategory", data: {
        "category": id,
      });

      if (response.statusCode == 200) {
        seriesCategory.value = SeriesCategory.fromJson(response.data);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e, st) {
      print('Error: $e');
      print('Error st: $st');
    } finally {
      isLoading1(false);
    }
  }

  void fetchCategoryChannel(String id) async {
    try {
      isLoading2(true);
      final response = await _dio
          .get("https://nooh.live/api/chaneel/getChannelsByCategory", data: {
        "category": id,
      });

      if (response.statusCode == 200) {
        channelCategory.value = ChannelCategoryModel.fromJson(response.data);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e, st) {
      print('Error: $e');
      print('Error st: $st');
    } finally {
      isLoading2(false);
    }
  }
}
