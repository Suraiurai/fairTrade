import 'package:dio/dio.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class ProductProofButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onTap;
  const ProductProofButton({super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.light100, borderRadius: BorderRadius.circular(80)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              icon,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AllText(text: text),
              ),
              Spacer(),
              AppIcons.arrowRight.svgPicture()
            ],
          ),
        ),
      ),
    );
  }
}
