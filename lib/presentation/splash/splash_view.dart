import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nooh/presentation/navigator_bar/nav_view.dart';
import 'package:nooh/presentation/resources/assets_manager.dart';
import 'package:nooh/presentation/resources/color_manager.dart';
import 'package:nooh/presentation/resources/constants_manager.dart';
import 'package:nooh/presentation/resources/transition_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    // Navigator.pushReplacementNamed(context, Routes.homeRoute);
    TransitionHelper.navigateOffAll(MyNavigatorBar(title: 'home'));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: FadeIn(
        duration: const Duration(seconds: 3),
        child: const Center(
          child: Image(
            image: AssetImage(ImageAssets.splashLogo),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
