import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nooh/domain/controller/match_details_controlller.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/domain/controller/ad_controller.dart';

class MatchView extends StatelessWidget {
  final String id;

  MatchView({required this.id});

  @override
  Widget build(BuildContext context) {
    final MatchDetailsController matchDetailsController =
        Get.put(MatchDetailsController());
    final AdController adController = Get.put(AdController());

    matchDetailsController.fetchMatchesDetails(id);

    return PopScope(
      onPopInvoked: (popInvoked) {
        matchDetailsController.disposeBetterPlayer();
        popInvoked = true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("matches".tr),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(children: [
              Obx(() {
                if (matchDetailsController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (matchDetailsController.matchDetails.value.data ==
                    null) {
                  return Center(child: Text('no matches found'.tr));
                } else {
                  final match = matchDetailsController.matchDetails.value.data!;
                  return Column(
                    children: [
                      Text("live matches".tr,
                          style: AppTextStyles.largeTitle16),
                      SizedBox(height: 10.h),
                      LiveMatchesCustom(
                        tournament: match.championship ?? "",
                        imageA: match.teamA?.openImage ?? "",
                        imageB: match.teamB?.openImage ?? "",
                        teamA: match.teamA?.name ?? "",
                        teamB: match.teamB?.name ?? "",
                        time: match.time ?? "",
                      ),
                      SizedBox(height: 10.h),
                      Text("choose your server".tr,
                          style: AppTextStyles.largeTitle16),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 40.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: match.streamUrl!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                matchDetailsController.selectedUrl.value =
                                    match.streamUrl![index];
                                matchDetailsController.initializeBetterPlayer(
                                    matchDetailsController.selectedUrl.value);
                                adController.showInterstitialAd();
                              },
                              child: Container(
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: ColorManager.primary,
                                ),
                                child: Center(
                                  child: Text('Server ${index + 1}',
                                      style: AppTextStyles.mediumTitle14),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10.w),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Obx(() {
                          if (matchDetailsController.isVideoLoading.value) {
                            return CircularProgressIndicator(); // Show loading while video is preparing
                          }
                          return AspectRatio(
                            aspectRatio: 16 / 9,
                            child: BetterPlayer(
                              controller: matchDetailsController
                                  .betterPlayerController!,
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                }
              }),
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
            ]),
          ),
        ),
      ),
    );
  }
}
