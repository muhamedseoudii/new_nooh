import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nooh/domain/controller/ad_controller.dart';
import 'package:nooh/domain/controller/show_details_controller.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

import 'channel_webview.dart';

class ChannelDetailsView extends StatelessWidget {
  final ShowDetailsController channelDetailsController =
      Get.put(ShowDetailsController());
  final String id;

  ChannelDetailsView({Key? key, required this.id}) : super(key: key) {
    channelDetailsController.fetchChannelDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    final AdController adController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if (channelDetailsController.isLoading2.value) {
            return Text(
              'loading'.tr,
              style: AppTextStyles.mediumWhiteTitle14,
            );
          }
          if (channelDetailsController.seriesDetails.value.isNull) {
            return Text('failed to load data'.tr);
          }
          final channel = channelDetailsController.channelDetails.value.data;
          return Text(
            channel?.title ?? '',
          );
        }),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Obx(() {
          if (channelDetailsController.isLoading2.value) {
            return Center(child: CircularProgressIndicator());
          } else if (channelDetailsController.channelDetails.value == null) {
            return Center(child: Text('No series details found.'));
          } else {
            final channel = channelDetailsController.channelDetails.value.data;
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                        width: 400.w,
                        height: 400.h,
                        channel?.image?.openImage ?? '',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      channel?.title ?? '',
                      style: AppTextStyles.largeTitle16,
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
                            "Language: ${channel?.lang}",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorManager.primary),
                          child: Text(
                            "Category: ${channel?.category?.title}",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorManager.primary),
                          child: Text(
                            "Type: ${channel?.category?.type}",
                            style: AppTextStyles.largeTitle16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        TransitionHelper.navigateTo(ChannelWebViewScreen(
                          url: channel?.streamUrl ?? '',
                          name: channel?.title ?? '',
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
