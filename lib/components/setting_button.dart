import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String text;
  final String? subText;
  final VoidCallback? onTap;

  const SettingButton(
      {super.key, required this.text,  this.subText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
           color: AppColors.light100, borderRadius: BorderRadius.circular(80),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              AllText(text: text),
              const SizedBox(width: 10),
              AllText(text: subText ?? "", color: AppColors.light600,),
              const Spacer(),
              AppIcons.arrowRight.svgPicture()
            ],
          ),
        ),
      ),
    );
  }
}
