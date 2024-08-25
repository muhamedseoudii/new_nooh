import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/channel_details_model.dart';
import 'package:nooh/domain/model/movies_details_model.dart';
import 'package:nooh/domain/model/series_details_model.dart';

class ShowDetailsController extends GetxController {
  var isLoading = true.obs;
  var isLoading1 = true.obs;
  var isLoading2 = true.obs;
  var seriesDetails = SeriesDetails().obs;
  var movieDetails = MovieDetails().obs;
  var channelDetails = ChannelDetails().obs;

  final Dio _dio = Dio();

  void fetchSeriesDetails(String id) async {
    try {
      isLoading(true);
      var response =
          await _dio.get('https://nooh.live/api/series/getOneSeries/$id');

      if (response.statusCode == 200) {
        seriesDetails.value = SeriesDetails.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to load series details');
      }
    } catch (e, st) {
      print('Error occurred: $e');
      print('Stack Trace: $st');
    } finally {
      isLoading(false);
    }
  }

  void fetchMovieDetails(String id) async {
    try {
      isLoading1(true);
      var response =
          await _dio.get('https://nooh.live/api/movie/getOneMovie/$id');

      if (response.statusCode == 200) {
        movieDetails.value = MovieDetails.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to load  movie details');
      }
    } catch (e, st) {
      print('Error occurred: $e');
      print('Stack Trace: $st');
    } finally {
      isLoading1(false);
    }
  }

  void fetchChannelDetails(String id) async {
    try {
      isLoading2(true);
      var response =
          await _dio.get('https://nooh.live/api/chaneel/getOneChaneel/$id');

      if (response.statusCode == 200) {
        channelDetails.value = ChannelDetails.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to load  channel details');
      }
    } catch (e, st) {
      print('Error occurred: $e');
      print('Stack Trace: $st');
    } finally {
      isLoading2(false);
    }
  }
}
