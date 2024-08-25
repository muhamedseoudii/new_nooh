import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/all_movie_controller.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

import 'movie_details.dart';

class ShowMoviesView extends StatelessWidget {
  const ShowMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final AllMovieController allMovieController = Get.put(AllMovieController());
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
            if (allMovieController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (allMovieController.allMovies.value.data == null ||
                allMovieController.allMovies.value.data!.isEmpty) {
              return Center(child: Text('No movies available'));
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: allMovieController.allMovies.value.data!.length,
                itemBuilder: (context, index) {
                  var allMovie =
                      allMovieController.allMovies.value.data![index];
                  return HomeTaskCustom(
                    onTap: () {
                      TransitionHelper.navigateTo(
                        MovieDetailsView(id: allMovie.sId ?? ''),
                      );
                    },
                    title: allMovie.title ?? '',
                    image: allMovie.image?.openImage ?? '',
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
