import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';

class SettingsListTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Widget? widget;
  final void Function()? onTap;
  final ColorFilter? colorFilter;

  const SettingsListTile({
    super.key,
    required this.text,
    this.widget,
    this.onTap,
    this.colorFilter,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 55.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.fromBorderSide(BorderSide(color: Colors.red)),
          ),
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              text,
              style: AppTextStyles.largeTitle16,
            ),
            trailing: widget,
          ),
        ),
      ),
    );
  }
}
