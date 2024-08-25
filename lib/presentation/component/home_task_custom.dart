import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';

class HomeTaskCustom extends StatelessWidget {
  final String title, image;
  final void Function()? onTap;
  final TextOverflow? overflow;

  const HomeTaskCustom({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 150.w,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  width: 1220.w,
                  height: 135.h,
                  image,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(height: 10.h),
                Text(
                  maxLines: 2,
                  overflow: overflow,
                  textAlign: TextAlign.center,
                  title,
                  style: AppTextStyles.mediumTitle14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeChannelCustom extends StatelessWidget {
  final String title, image;
  final void Function()? onTap;

  const HomeChannelCustom({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 150.w,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.scaleDown,
                  width: 100.w,
                  height: 100.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  title,
                  style: AppTextStyles.largeTitle16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LiveMatchesCustom extends StatelessWidget {
  final String tournament, imageA, imageB, teamA, teamB, time;
  final void Function()? onTap;

  const LiveMatchesCustom({
    super.key,
    required this.tournament,
    required this.imageA,
    required this.imageB,
    required this.teamA,
    required this.teamB,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(tournament, style: AppTextStyles.largeTitle16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: Image.network(
                          imageA,
                        ),
                      ),
                      Text(teamA, style: AppTextStyles.mediumTitle14),
                    ],
                  ),
                  Text(time, style: AppTextStyles.mediumTitle14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: Image.network(
                          imageB,
                        ),
                      ),
                      Text(teamB, style: AppTextStyles.mediumTitle14),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterCustom extends StatelessWidget {
  final String title;
  final void Function()? onRemove, onAdd;

  const CounterCustom({
    super.key,
    required this.title,
    this.onRemove,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onRemove,
          child: Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  topLeft: Radius.circular(50.r)),
              color: const Color(0xff01ca0a),
            ),
            child: const Center(
              child: Icon(
                Icons.remove,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(title, style: AppTextStyles.mediumTitle14),
        InkWell(
          onTap: onAdd,
          child: Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.r),
                  topRight: Radius.circular(50.r)),
              color: const Color(0xff01ca0a),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
