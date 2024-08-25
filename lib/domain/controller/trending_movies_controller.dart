import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nooh/domain/model/trending_movies_model.dart';

class TrendingMovieController extends GetxController {
  var isLoading = true.obs;
  var trendingMovies = <Movie>[].obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchTrendingMovies();
    super.onInit();
  }

  void fetchTrendingMovies() async {
    try {
      isLoading(true);
      final response =
          await _dio.get("https://nooh.live/api/movie/getTrendingMovies");

      if (response.statusCode == 200) {
        var moviesData = TrendingMovies.fromJson(response.data);
        if (moviesData.data != null && moviesData.status == "true") {
          trendingMovies.assignAll(moviesData.data!);
        }
      } else {
        print("Failed to load trending movies: ${response.statusCode}");
      }
    } catch (e, st) {
      print("Error occurred: $e");
      print("ST Error occurred: $st");
    } finally {
      isLoading(false);
    }
  }
}
