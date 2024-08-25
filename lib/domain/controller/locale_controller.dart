import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nooh/main.dart';

class LocaleController extends GetxController {
  Locale get inialLang =>
      pref?.getString("lang") == "ar" ? const Locale("ar") : const Locale("en");

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    pref?.setString("lang", codeLang);
    Get.updateLocale(locale);
  }
}
