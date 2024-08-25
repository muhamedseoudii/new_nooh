import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/domain/controller/locale_controller.dart';


class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController controllerLang = Get.find<LocaleController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "change language".tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("English"),
                    value: "en",
                    groupValue: controllerLang.inialLang.languageCode,
                    onChanged: (value) {
                      controllerLang.changeLang(value!);
                      Get.back();
                    },
                  ),
                  Divider(
                    indent: 55.sp,
                    endIndent: 20.sp,
                    color: Colors.grey,
                  ),
                  RadioListTile<String>(
                    title: const Text("عربى"),
                    value: "ar",
                    groupValue: controllerLang.inialLang.languageCode,
                    onChanged: (value) {
                      controllerLang.changeLang(value!);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
