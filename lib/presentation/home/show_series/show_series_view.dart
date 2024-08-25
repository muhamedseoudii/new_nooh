import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/all_series_controller.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/home/show_series/series_details.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

class ShowSeriesView extends StatelessWidget {
  const ShowSeriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final AllSeriesController allSeriesController =
        Get.put(AllSeriesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "show series".tr,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Obx(
          () {
            if (allSeriesController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (allSeriesController.allSeries.value.data == null ||
                allSeriesController.allSeries.value.data!.isEmpty) {
              return Center(child: Text('No series available'));
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: allSeriesController.allSeries.value.data!.length,
                itemBuilder: (context, index) {
                  var allSeries =
                      allSeriesController.allSeries.value.data![index];
                  return HomeTaskCustom(
                    onTap: () {
                      TransitionHelper.navigateTo(
                        SeriesDetailsView(id: allSeries.sId ?? ''),
                      );
                    },
                    title: allSeries.title ?? '',
                    image: allSeries.image?.openImage ?? '',
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
