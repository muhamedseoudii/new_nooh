import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nooh/presentation/resources/color_manager.dart';

class HomeBarView extends StatefulWidget {
  final PageController controller;

  const HomeBarView({super.key, required this.controller});

  @override
  State<HomeBarView> createState() => _HomeBarViewState();
}

class _HomeBarViewState extends State<HomeBarView> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentPage = widget.controller.page!.round();
      });
    });
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.transparent,
      shape: const CircularNotchedRectangle(),
      padding: const EdgeInsets.only(top: 12),
      notchMargin: 10,
      elevation: 55,
      child: Row(
        children: [
          ItemBottom(
            isSelected: currentPage == 0,
            unselectedImage: "home",
            image: "home.svg",
            title: "home".tr,
            onTap: () {
              widget.controller.jumpToPage(0);
              currentPage = 0;
              setState(() {});
            },
          ),
          ItemBottom(
            unselectedImage: "message",
            isSelected: currentPage == 1,
            image: "newSearch.svg",
            title: "search".tr,
            onTap: () {
              widget.controller.jumpToPage(1);
              currentPage = 1;
              setState(() {});
            },
          ),
          ItemBottom(
              isSelected: currentPage == 2,
              image: "stadium.svg",
              unselectedImage: "profile",
              title: "matches".tr,
              onTap: () {
                widget.controller.jumpToPage(2);
                currentPage = 2;
                setState(() {});
              }),
          ItemBottom(
            isSelected: currentPage == 3,
            image: "settings.svg",
            unselectedImage: "Settings",
            title: "settings".tr,
            onTap: () {
              widget.controller.jumpToPage(3);
              currentPage = 3;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class ItemBottom extends StatelessWidget {
  final String title, image, unselectedImage;
  final VoidCallback onTap;
  final bool isSelected;

  const ItemBottom(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap,
      this.isSelected = false,
      required this.unselectedImage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              width: 30.w,
              height: 30.h,
              fit: BoxFit.scaleDown,
              "assets/icons/$image",
              colorFilter: ColorFilter.mode(
                  isSelected ? ColorManager.primary : ColorManager.lightGrey,
                  BlendMode.srcIn),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color:
                    isSelected ? ColorManager.primary : ColorManager.lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
