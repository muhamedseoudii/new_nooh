import 'package:flutter/material.dart';
import 'package:nooh/presentation/resources/styles_manager.dart';

class RowTextComponent extends StatelessWidget {
  final String text;
  final String text1;
  final void Function()? onClick;

  const RowTextComponent({
    super.key,
    required this.text,
    required this.text1,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.largeTitle16,
          ),
        ),
        TextButton(
          onPressed: onClick,
          child: Text(
            text1,
            style: AppTextStyles.largeTitleOrange14,
          ),
        ),
      ],
    );
  }
}
