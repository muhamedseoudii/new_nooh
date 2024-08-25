import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/ad_controller.dart';
import 'package:nooh/domain/controller/trending_series_controller.dart';
import 'package:nooh/domain/controller/trending_channel_controller.dart';
import 'package:nooh/domain/controller/trending_movies_controller.dart';
import 'package:nooh/presentation/category/channel_category/channel_category_view.dart';
import 'package:nooh/presentation/category/movie_category/movie_category_view.dart';
import 'package:nooh/presentation/category/series_category/series_category_view.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/component/row_text_custom.dart';
import 'package:nooh/presentation/football_screen/football_view.dart';
import 'package:nooh/presentation/home/show_channel/show_channel_view.dart';
import 'package:nooh/presentation/home/show_movies/show_movies_view.dart';
import 'package:nooh/presentation/home/show_series/series_details.dart';
import 'package:nooh/presentation/home/show_series/show_series_view.dart';
import 'package:nooh/presentation/resources/assets_manager.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import 'show_channel/channel_details.dart';
import 'show_movies/movie_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TrendingMovieController movieController =
        Get.put(TrendingMovieController());
    final SeriesController seriesController = Get.put(SeriesController());
    final TrendingChannelController trendingChannelController =
        Get.put(TrendingChannelController());
    final AdController adController = Get.put(AdController())
      ..fetchTelegramPage();

    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r)),
                  color: ColorManager.primary,
                ),
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: 80.h,
                        width: 80.w,
                        ImageAssets.splashLogo,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        "welcome to nooh".tr,
                        style: AppTextStyles.largeTitleWhite20,
                      ),
                    ]),
              ),
              ListTile(
                onTap: () {
                  TransitionHelper.navigateTo(const MovieCategoryView());
                },
                leading: Image.asset(
                  "assets/icons/movie.png",
                  height: 30.h,
                  width: 30.w,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                title: Text(
                  "movie".tr,
                  style: AppTextStyles.mediumTitle16,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.sp,
                ),
              ),
              ListTile(
                onTap: () {
                  TransitionHelper.navigateTo(const SeriesCategoryView());
                },
                leading: Image.asset(
                  "assets/icons/series.png",
                  height: 30.h,
                  width: 30.w,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                title: Text(
                  "series".tr,
                  style: AppTextStyles.mediumTitle16,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.sp,
                ),
              ),
              ListTile(
                onTap: () {
                  TransitionHelper.navigateTo(const ChannelCategoryView());
                },
                leading: Image.asset(
                  "assets/icons/channel.png",
                  height: 30.h,
                  width: 30.w,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                title: Text(
                  "channel".tr,
                  style: AppTextStyles.mediumTitle16,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.sp,
                ),
              ),
              ListTile(
                onTap: () {
                  TransitionHelper.navigateTo(const FootballView());
                },
                leading: Image.asset(
                  "assets/icons/matches.png",
                  height: 30.h,
                  width: 30.w,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                title: Text(
                  "matches".tr,
                  style: AppTextStyles.mediumTitle16,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "home".tr,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  RowTextComponent(
                    text: "trending movies".tr,
                    text1: "see more".tr,
                    onClick: () {
                      TransitionHelper.navigateTo(const ShowMoviesView());
                    },
                  ),
                  SizedBox(height: 10.h),
                  Obx(() {
                    if (movieController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (movieController.trendingMovies.isEmpty) {
                      return Center(child: Text("No trending movies found"));
                    } else {
                      return SizedBox(
                        height: 210.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieController.trendingMovies.length,
                          itemBuilder: (context, index) {
                            final movie = movieController.trendingMovies[index];
                            return HomeTaskCustom(
                              onTap: () {
                                TransitionHelper.navigateTo(
                                  MovieDetailsView(id: movie.id ?? ''),
                                );
                              },
                              overflow: TextOverflow.ellipsis,
                              title: movie.title ?? '',
                              image: movie.image?.openImage ?? '',
                            );
                          },
                        ),
                      );
                    }
                  }),
                  RowTextComponent(
                    text: "trending series".tr,
                    text1: "see more".tr,
                    onClick: () {
                      TransitionHelper.navigateTo(const ShowSeriesView());
                    },
                  ),
                  SizedBox(height: 10.h),
                  Obx(() {
                    if (seriesController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (seriesController.trendingSeriesList.isEmpty) {
                      return Center(child: Text("No trending series found"));
                    } else {
                      return SizedBox(
                        height: 210.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: seriesController.trendingSeriesList.length,
                          itemBuilder: (context, index) {
                            final series =
                                seriesController.trendingSeriesList[index];
                            return HomeTaskCustom(
                              onTap: () {
                                TransitionHelper.navigateTo(
                                    SeriesDetailsView(id: series.id ?? ''));
                              },
                              overflow: TextOverflow.ellipsis,
                              title: series.title ?? '',
                              image: series.image?.openImage ?? '',
                            );
                          },
                        ),
                      );
                    }
                  }),
                  RowTextComponent(
                    text: "most watched channels".tr,
                    text1: "see more".tr,
                    onClick: () {
                      TransitionHelper.navigateTo(const ShowChannelView());
                    },
                  ),
                  SizedBox(height: 10.h),
                  Obx(() {
                    if (trendingChannelController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (trendingChannelController
                        .trendingChannels.isEmpty) {
                      return Center(child: Text("No trending channel found"));
                    } else {
                      return SizedBox(
                        height: 210.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              trendingChannelController.trendingChannels.length,
                          itemBuilder: (context, index) {
                            final channel = trendingChannelController
                                .trendingChannels[index];
                            return HomeTaskCustom(
                              onTap: () {
                                TransitionHelper.navigateTo(
                                    ChannelDetailsView(id: channel.id ?? ''));
                              },
                              overflow: TextOverflow.ellipsis,
                              title: channel.title ?? '',
                              image: channel.image?.openImage ?? '',
                            );
                          },
                        ),
                      );
                    }
                  }),
                  SizedBox(height: 10.h),
                  // Obx(() {
                  //   if (adController.isBannerAdLoaded.value) {
                  //     return Container(
                  //       width: adController.bannerAd!.size.width.toDouble(),
                  //       height: adController.bannerAd!.size.height.toDouble(),
                  //       child: AdWidget(ad: adController.bannerAd!),
                  //     );
                  //   } else {
                  //     return Text('Loading ad...');
                  //   }
                  // }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        onPressed: () {
          var telegram = adController.adsData.value.data?[0];
          if (telegram?.telegramPage != null) {
            launchUrl(
              Uri.parse("https://t.me/${telegram?.telegramPage}"),
              mode: LaunchMode.externalNonBrowserApplication,
            );
          } else {
            print('Telegram page URL is not available.');
          }
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: const AssetImage("assets/icons/telegram.png"),
          radius: 40.r,
        ),
      ),
    );
  }
}
