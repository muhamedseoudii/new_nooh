import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/ad_controller.dart';
import 'package:nooh/domain/controller/matches_controller.dart';
import 'package:nooh/presentation/component/home_task_custom.dart';
import 'package:nooh/presentation/football_screen/match_view.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

class FootballView extends StatelessWidget {
  const FootballView({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchController matchController = Get.put(MatchController());
    final AdController adController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "matches".tr,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            children: [
              Text("live matches".tr, style: AppTextStyles.largeTitle16),
              SizedBox(height: 10.h),
              Obx(() {
                if (matchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (matchController.matches.value.data == null ||
                    matchController.matches.value.data!.isEmpty) {
                  return Center(child: Text('No matches found.'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: matchController.matches.value.data!.length,
                      itemBuilder: (context, index) {
                        var match = matchController.matches.value.data![index];
                        return LiveMatchesCustom(
                          onTap: () {
                            TransitionHelper.navigateTo(MatchView(
                              id: match.id ?? "",
                            ));
                            adController.showInterstitialAd();
                          },
                          tournament: match.championship ?? "",
                          imageA: match.teamA?.openImage ?? "",
                          imageB: match.teamB?.openImage ?? "",
                          teamA: match.teamA?.name ?? "",
                          teamB: match.teamB?.name ?? "",
                          time: match.time ?? "",
                        );
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
