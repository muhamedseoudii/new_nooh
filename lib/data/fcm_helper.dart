import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nooh/main.dart';
import 'package:nooh/presentation/football_screen/football_view.dart';

import 'package:nooh/presentation/home/show_movies/show_movies_view.dart';
import 'package:nooh/presentation/home/show_series/show_series_view.dart';
import 'package:nooh/presentation/navigator_bar/nav_view.dart';

import '../presentation/home/show_channel/show_channel_view.dart';

class FCMHelper {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initPushNotification() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    // Subscribe to the 'all' topic
    FirebaseMessaging.instance.subscribeToTopic('all').then((_) {
      print('Subscribed to "all" topic');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Received message while in foreground: ${message.notification?.title}, '
          '${message.notification?.body}');
      if (message.data['screen'] == "movie") {
        Get.dialog(
          AlertDialog(
            title: Text(message.notification?.title ?? 'New Product'),
            content: Text(message.notification?.body ?? 'New Product'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('close'.tr),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => const ShowMoviesView());
                },
                child: Text('view'.tr),
              ),
            ],
          ),
        );
      } else if (message.data['screen'] == "match") {
        Get.dialog(
          AlertDialog(
            title: Text(message.notification?.title ?? 'New Product'),
            content: Text(message.notification?.body ?? 'New Product'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('close'.tr),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => const FootballView());
                },
                child: Text('view'.tr),
              ),
            ],
          ),
        );
      } else if (message.data['screen'] == "channel") {
        Get.dialog(
          AlertDialog(
            title: Text(message.notification?.title ?? 'New Product'),
            content: Text(message.notification?.body ?? 'New Product'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('close'.tr),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => const ShowChannelView());
                },
                child: Text('view'.tr),
              ),
            ],
          ),
        );
      } else if (message.data['screen'] == "series") {
        Get.dialog(
          AlertDialog(
            title: Text(message.notification?.title ?? 'New Product'),
            content: Text(message.notification?.body ?? 'New Product'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('close'.tr),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => const ShowSeriesView());
                },
                child: Text('view'.tr),
              ),
            ],
          ),
        );
      } else {
        Get.dialog(
          AlertDialog(
            title: Text(message.notification?.title ?? 'New Product'),
            content: Text(message.notification?.body ?? 'New Product'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('close'.tr),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => MyNavigatorBar(title: 'home'));
                },
                child: Text('view'.tr),
              ),
            ],
          ),
        );
      }
    });
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked: ${message.notification?.title}, '
          '${message.notification?.body}');

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
    });
  }
}
