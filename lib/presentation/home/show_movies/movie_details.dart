import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nooh/domain/controller/ad_controller.dart';
import 'package:nooh/domain/controller/show_details_controller.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

import 'movie_webview.dart';

class MovieDetailsView extends StatelessWidget {
  final ShowDetailsController movieDetailsController =
      Get.put(ShowDetailsController());
  final String id;

  MovieDetailsView({Key? key, required this.id}) : super(key: key) {
    movieDetailsController.fetchMovieDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    final AdController adController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if (movieDetailsController.isLoading1.value) {
            return Text(
              'loading'.tr,
              style: AppTextStyles.mediumWhiteTitle14,
            );
          }
          if (movieDetailsController.seriesDetails.value.isNull) {
            return Text('failed to load data'.tr);
          }
          final movie = movieDetailsController.movieDetails.value.data;
          return Text(
            movie?.title ?? '',
          );
        }),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Obx(() {
          if (movieDetailsController.isLoading1.value) {
            return Center(child: CircularProgressIndicator());
          } else if (movieDetailsController.movieDetails.value == null) {
            return Center(child: Text('no movie details found.'.tr));
          } else {
            final movie = movieDetailsController.movieDetails.value.data;
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 400.w,
                        height: 400.h,
                        child: Image.network(
                          movie?.image?.openImage ?? '',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movie?.title ?? '',
                          style: AppTextStyles.largeTitle16,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          movie!.releaseDate.toString(),
                          style: AppTextStyles.largeTitle16,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.justify,
                      movie.description ?? '',
                      style: AppTextStyles.largeTitleNoOverFlow14,
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorManager.primary),
                          child: Text(
                            "Language: ${movie.lang}",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorManager.primary),
                          child: Text(
                            "IMDb: ${movie.rating.toString()}/10",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorManager.primary),
                          child: Text(
                            "${movie.duration.toString()} hours",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        TransitionHelper.navigateTo(MovieWebViewScreen(
                          url: movie.videoUrl ?? '',
                          name: movie.title ?? '',
                        ));
                        adController.showInterstitialAd();
                      },
                      child: Container(
                        width: 200.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: ColorManager.green,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "watch now".tr,
                                style: AppTextStyles.largeTitle20,
                              ),
                              Icon(
                                Icons.play_circle_outlined,
                                size: 30.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(() {
                      if (adController.isBannerAdLoaded.value) {
                        return Container(
                          width: adController.bannerAd!.size.width.toDouble(),
                          height: adController.bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: adController.bannerAd!),
                        );
                      } else {
                        return Text('Loading ad...');
                      }
                    }),
                  ],
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
