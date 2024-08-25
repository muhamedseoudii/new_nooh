import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/categories_model.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var isLoading1 = true.obs;
  var isLoading2 = true.obs;
  var category = Categories().obs;

  final Dio _dio = Dio();

  void fetchCategoryChannel() async {
    try {
      isLoading(true);
      final response = await _dio
          .get("https://nooh.live/api/category/getcategories/channel");

      if (response.statusCode == 200) {
        category.value = Categories.fromJson(response.data);
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

  void fetchCategoryMovie() async {
    try {
      isLoading1(true);
      final response =
          await _dio.get("https://nooh.live/api/category/getcategories/movie");

      if (response.statusCode == 200) {
        category.value = Categories.fromJson(response.data);
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

  void fetchCategorySeries() async {
    try {
      isLoading2(true);
      final response =
          await _dio.get("https://nooh.live/api/category/getcategories/series");

      if (response.statusCode == 200) {
        category.value = Categories.fromJson(response.data);
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
