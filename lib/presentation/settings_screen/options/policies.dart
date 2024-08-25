import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';

class PolicesView extends StatelessWidget {
  const PolicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "policies".tr,
        ),
      ),
      body: const SafeArea(
          child: Text(
        "Welcome to policies",
        style: AppTextStyles.largeTitle16,
      )),
    );
  }
}
