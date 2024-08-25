import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';

class CallMeCustom extends StatelessWidget {
  final String title, tel;
  final String icon;
  final void Function()? onClick;

  const CallMeCustom({
    super.key,
    required this.title,
    required this.tel,
    required this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 400.w,
        height: 60.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: const Color(0xff54A7D3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              "assets/icons/$icon.svg",
              fit: BoxFit.contain,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.largeTitle16,
                ),
                SizedBox(width: 8.w),
                Text(
                  tel,
                  style: AppTextStyles.mediumTitle14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WhatsAppCustom extends StatelessWidget {
  final String title, desc;
  final String icon;
  final void Function()? onClick;

  const WhatsAppCustom({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 400.w,
        height: 80.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: const Color(0xff25D366)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              "assets/icons/$icon.svg",
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.largeTitle16,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    desc,
                    style: TextStyle(
                        color: const Color(0xffF5F5F5), fontSize: 14.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
