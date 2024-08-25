import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nooh/app/app_root.dart';
import 'package:nooh/data/dependancy_injection.dart';
import 'package:nooh/data/fcm_helper.dart';
import 'package:nooh/presentation/football_screen/football_view.dart';
import 'package:nooh/presentation/home/show_movies/show_movies_view.dart';
import 'package:nooh/presentation/home/show_series/show_series_view.dart';
import 'package:nooh/presentation/navigator_bar/nav_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'presentation/home/show_channel/show_channel_view.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.data['screen'] == "movie") {
    Get.to(() => const ShowMoviesView());
  } else if (message.data['screen'] == "match") {
    Get.to(() => const FootballView());
  } else if (message.data['screen'] == "channel") {
    Get.to(() => const ShowChannelView());
  } else if (message.data['screen'] == "series") {
    Get.to(() => const ShowSeriesView());
  } else {
    Get.to(() => MyNavigatorBar(title: 'home'));
  }
}

SharedPreferences? pref;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  MobileAds.instance.initialize();
  final FCMHelper fcmHelper = FCMHelper();
  await fcmHelper.initPushNotification();
  await initSharedPreferences().then((prefs) {
    pref = prefs;
    // Get.put(() => ThemeController().loadThemeFromPreferences());
  });
  DependencyInjection.init();
  runApp(const MyApp());
}

Future<SharedPreferences> initSharedPreferences() async {
  return await SharedPreferences.getInstance();
}
