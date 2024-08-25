import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/list_categories_controller.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/home/show_movies/movie_details.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

class MovieListView extends StatelessWidget {
  final ListCategoryController listCategoryController =
      Get.put(ListCategoryController());
  final String id;

  MovieListView({Key? key, required this.id}) : super(key: key) {
    listCategoryController.fetchMovieCategory(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "show movies".tr,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Obx(
          () {
            if (listCategoryController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (listCategoryController.movieCategory.value.data ==
                    null ||
                listCategoryController.movieCategory.value.data!.isEmpty) {
              return Center(child: Text('no movies available'.tr));
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount:
                    listCategoryController.movieCategory.value.data!.length,
                itemBuilder: (context, index) {
                  var category =
                      listCategoryController.movieCategory.value.data![index];
                  return HomeTaskCustom(
                    onTap: () {
                      TransitionHelper.navigateTo(
                        MovieDetailsView(id: category.sId ?? ''),
                      );
                    },
                    title: category.title ?? '',
                    image: category.image?.openImage ?? '',
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
