import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/theme_controller.dart';
import 'package:nooh/presentation/component/settings_list_tile.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';
import 'package:nooh/presentation/settings_screen/options/policies.dart';
import 'package:nooh/presentation/settings_screen/options/terms.dart';
import 'package:url_launcher/url_launcher.dart';

import 'options/change_language_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings".tr,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  SettingsListTile(
                    icon: Icons.language,
                    text: "change language".tr,
                    widget: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20.sp,
                    ),
                    onTap: () {
                      TransitionHelper.navigateTo(const LanguageView());
                    },
                  ),
                  SizedBox(height: 15.h),
                  SettingsListTile(
                    icon: Icons.mode_night,
                    text: "night mode".tr,
                    widget: Obx(() => Switch(
                          activeColor: ColorManager.lightPrimary,
                          inactiveTrackColor: ColorManager.offWhite,
                          value: themeController.switchValue.value,
                          onChanged: (value) {
                            themeController.toggleTheme();
                          },
                        )),
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                  SizedBox(height: 15.h),
                  SettingsListTile(
                    icon: Icons.share,
                    text: "share the app".tr,
                    widget: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20.sp,
                    ),
                    onTap: () {
                      launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.arcodx.nooh'),
                          mode: LaunchMode.externalNonBrowserApplication);
                    },
                  ),
                  SizedBox(height: 15.h),
                  SettingsListTile(
                    icon: Icons.policy,
                    text: "policies".tr,
                    widget: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20.sp,
                    ),
                    onTap: () {
                      TransitionHelper.navigateTo(const PolicesView());
                    },
                  ),
                  SizedBox(height: 15.h),
                  SettingsListTile(
                    icon: Icons.terminal_outlined,
                    text: "terms".tr,
                    widget: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20.sp,
                    ),
                    onTap: () {
                      TransitionHelper.navigateTo(const TermsView());
                    },
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                "V1.0 ©NOOH | by MAK Software",
                style: AppTextStyles.mediumGreyTitle14,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
