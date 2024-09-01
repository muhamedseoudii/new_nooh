import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nooh/domain/controller/ad_controller.dart';
import 'package:nooh/domain/controller/show_details_controller.dart';
import 'package:nooh/presentation/home/show_series/series_webview.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

class SeriesDetailsView extends StatelessWidget {
  final ShowDetailsController seriesDetailsController =
      Get.put(ShowDetailsController());
  final String id;

  SeriesDetailsView({Key? key, required this.id}) : super(key: key) {
    seriesDetailsController.fetchSeriesDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    final AdController adController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if (seriesDetailsController.isLoading.value) {
            return Text(
              'loading'.tr,
              style: AppTextStyles.mediumWhiteTitle14,
            );
          }
          if (seriesDetailsController.seriesDetails.value.isNull) {
            return Text('failed to load data'.tr);
          }
          final series = seriesDetailsController.seriesDetails.value.data;
          return Text(
            series?.title ?? '',
          );
        }),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Obx(() {
          if (seriesDetailsController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (seriesDetailsController.seriesDetails.value == null) {
            return Center(child: Text('No series details found.'));
          } else {
            final series = seriesDetailsController.seriesDetails.value.data;
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                        width: 400.w,
                        height: 400.h,
                        series?.image?.openImage ?? '',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          series?.title ?? '',
                          style: AppTextStyles.largeTitle16,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          series!.releaseDate.toString(),
                          style: AppTextStyles.largeTitle16,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.justify,
                      series.description ?? '',
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
                            "Language: ${series.lang}",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorManager.primary),
                          child: Text(
                            "IMDb: ${series.rating}/10",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorManager.primary),
                          child: Text(
                            "${series.category?.title.toString()} ",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "episodes".tr,
                      style: AppTextStyles.largeTitle16,
                    ),
                    SizedBox(height: 20.h),
                    series.episodes != null && series.episodes!.isNotEmpty
                        ? Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children: series.episodes!
                                .map(
                                  (episode) => InkWell(
                                    onTap: () {
                                      TransitionHelper.navigateTo(
                                          SeriesWebViewScreen(
                                        url: episode.videoUrl ?? '',
                                        name: series.title ?? '',
                                      ));
                                      adController.showInterstitialAd();
                                    },
                                    child: Container(
                                      width: 60.w,
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: ColorManager.primary,
                                      ),
                                      child: Center(
                                        child: Text(
                                          episode.title.toString(),
                                          style: AppTextStyles.largeTitle16,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : Center(
                            child: Text(
                              'No episodes available',
                              style: AppTextStyles.largeTitle16,
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
