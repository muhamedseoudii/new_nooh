import 'package:flutter/material.dart';
import '../football_screen/football_view.dart';
import '../home/home_view.dart';
import '../search/search_view.dart';
import '../settings_screen/settings_view.dart';
import 'homeBar/view.dart';

class MyNavigatorBar extends StatelessWidget {
  final String title;

  MyNavigatorBar({super.key, required this.title});

  static const List<Widget> pages = [
    HomeView(),
    SearchView(),
    FootballView(),
    SettingsView(),
  ];
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: PageView.builder(
            itemCount: pages.length,
            controller: controller,
            itemBuilder: (context, index) => pages[index],
          ),
          // pages[currentPage],
        ),
        bottomNavigationBar: HomeBarView(
          controller: controller,
        ));
  }
}
