import 'package:dubai_project/components/text.dart';
import 'package:flutter/material.dart';

import '../utilities/theme.dart';

class SearchButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isActive;

  const SearchButton(
    this.text, {
    super.key,
    this.onTap,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: isActive ?  AppColors.p1 : AppColors.light100,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: AllText(text: text, color: isActive ? AppColors.whiteCustom : AppColors.light600,),
        ),
      ),
    );
  }
}