import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/category_controller.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

import 'series_list_view.dart';

class SeriesCategoryView extends StatelessWidget {
  const SeriesCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController())
      ..fetchCategorySeries();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "series category".tr,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () {
              if (categoryController.isLoading2.value) {
                return Center(child: CircularProgressIndicator());
              } else if (categoryController.category.value.data == null ||
                  categoryController.category.value.data!.isEmpty) {
                return Center(child: Text('No category available'));
              } else {
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var category =
                        categoryController.category.value.data![index];
                    return ListTile(
                      onTap: () {
                        TransitionHelper.navigateTo(
                            SeriesListView(id: category.sId ?? ''));
                      },
                      title: Text(category.title ?? '',
                          style: AppTextStyles.mediumTitle14),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20.sp,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    endIndent: 12,
                    indent: 12,
                  ),
                  itemCount: categoryController.category.value.data!.length,
                );
              }
            },
          ),
        ));
  }
}
