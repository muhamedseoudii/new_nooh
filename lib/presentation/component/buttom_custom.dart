import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledButtomEdit extends StatelessWidget {
  final String text;
  final Color buttonColor, textColor;
  final double size;
  final FocusNode? focusNodes;
  final void Function()? onClick;
  const FilledButtomEdit(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.size,
      required this.textColor,
      required this.onClick,
      this.focusNodes});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        focusNode: focusNodes,
        onPressed: onClick,
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(330.w, 50.h),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: size.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
