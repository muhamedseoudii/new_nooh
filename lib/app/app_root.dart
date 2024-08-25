import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nooh/data/my_bindings.dart';
import 'package:nooh/data/my_locale.dart';
import 'package:nooh/domain/controller/locale_controller.dart';
import 'package:nooh/domain/controller/theme_controller.dart';
import 'package:nooh/presentation/resources/theme_manager.dart';
import 'package:nooh/presentation/splash/splash_view.dart';

import '../presentation/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Nooh',
          debugShowCheckedModeBanner: false,
          locale: controller.inialLang,
          translations: MyLocale(),
          theme: ThemeClass().lightTheme,
          darkTheme: ThemeClass().darkTheme,
          themeMode: ThemeController().isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          onGenerateRoute: RoutesGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          initialBinding: MyBindings(),
          getPages: [
            GetPage(
                name: '/',
                page: () => const SplashView(),
                binding: MyBindings()),
          ],
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
