import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransitionHelper {
  static void navigateTo(Widget page, {dynamic arguments}) {
    Get.to(
      () => page,
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
      arguments: arguments,
      routeName: page.toString(),
    );
  }

  static void navigateOffAll(Widget page, {dynamic arguments}) {
    Get.offAll(
      () => page,
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
      arguments: arguments,
      routeName: page.toString(),
    );
  }

  static void navigateOff(Widget page, {dynamic arguments}) {
    Get.off(
      () => page,
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
      arguments: arguments,
      routeName: page.toString(),
    );
  }
}
