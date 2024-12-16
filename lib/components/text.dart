import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';


class AllText extends StatelessWidget {
  const AllText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.color = AppColors.blackCustom,
    this.textAlign = TextAlign.start, 
    this.maxLine,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
        color: color,
      ),
    );
  }
}