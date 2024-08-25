import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/all_movies_model.dart';

class AllMovieController extends GetxController {
  var isLoading = true.obs;
  var allMovies = AllMovies().obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchAllMovies();
    super.onInit();
  }

  void fetchAllMovies() async {
    try {
      isLoading(true);
      final response = await _dio.get("https://nooh.live/api/movie/getMovies");

      if (response.statusCode == 200) {
        allMovies.value = AllMovies.fromJson(response.data);
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
