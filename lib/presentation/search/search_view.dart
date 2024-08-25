import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/search_controller.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/component/text_field_custom.dart';
import 'package:nooh/presentation/home/show_channel/channel_details.dart';
import 'package:nooh/presentation/home/show_movies/movie_details.dart';
import 'package:nooh/presentation/home/show_series/series_details.dart';
import 'package:nooh/presentation/resources/assets_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchBarController searchController = Get.put(SearchBarController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "search".tr,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              SearchTextField(
                image: "assets/icons/search.svg",
                hintText: "type something".tr,
                controller: searchController.searchTextController,
                onClick: () {
                  searchController.searchTextController.clear();
                },
                onChange: (value) {
                  if (value.isNotEmpty) {
                    searchController.fetchAllSeries(value);
                  }
                },
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Obx(() {
                  if (searchController.searchResults.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageAssets.noSearchLogo,
                          fit: BoxFit.contain,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey
                              : Colors.black,
                          width: 150.w,
                          height: 150.h,
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: Text(
                            "no items found".tr,
                            style: AppTextStyles.largeTitle20,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return searchController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            padding: const EdgeInsets.all(8.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: searchController.searchResults.length,
                            itemBuilder: (BuildContext context, int index) {
                              var result =
                                  searchController.searchResults[index];

                              return HomeTaskCustom(
                                onTap: () {
                                  if (result.type == "movie") {
                                    TransitionHelper.navigateTo(
                                      MovieDetailsView(id: result.id ?? ''),
                                    );
                                  } else if (result.type == "series") {
                                    TransitionHelper.navigateTo(
                                      SeriesDetailsView(id: result.id ?? ''),
                                    );
                                  } else {
                                    TransitionHelper.navigateTo(
                                      ChannelDetailsView(id: result.id ?? ''),
                                    );
                                  }
                                },
                                title: result.title ?? '',
                                image: result.image?.openImage ?? '',
                              );
                            },
                          );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
