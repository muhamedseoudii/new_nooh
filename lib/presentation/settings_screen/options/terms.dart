import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nooh/presentation/resources/styles_manager.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "terms".tr,
        ),
      ),
      body: const SafeArea(
          child: Text(
        "Welcome to terms",
        style: AppTextStyles.largeTitle16,
      )),
    );
  }
}
