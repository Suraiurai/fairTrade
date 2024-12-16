import 'package:dubai_project/components/text.dart';
import 'package:flutter/material.dart';
import '../utilities/theme.dart';

class RoundedIconTextButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final double padd;
  final double? w;
  final double? h;

  const RoundedIconTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.backgroundColor = AppColors.whiteCustom,
    this.onTap,
    this.padd = 10,
    this.w,
    this.h,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: w,
        height: h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: backgroundColor,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: padd), 
                AllText(text: text),
              ],
            ),
        ),
      ),
    );
  }
}
