import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/model/search_model.dart';

class SearchBarController extends GetxController {
  var searchTextController = TextEditingController();
  var isLoading = true.obs;
  var searchResults = <SearchData>[].obs;

  final Dio _dio = Dio();

  void fetchAllSeries(String query) async {
    try {
      isLoading(true);
      final response = await _dio.get("https://nooh.live/api/search/$query");

      if (response.statusCode == 201) {
        var result = SearchModel.fromJson(response.data);
        searchResults.assignAll(result.data ?? []);
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
