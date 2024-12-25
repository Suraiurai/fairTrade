import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback? onTap;
  // final bool isActive;
  const ProductCategory({super.key, required this.text, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.light100,
          borderRadius: BorderRadius.circular(80)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                width: 27,
                height: 27,
                child: icon),
            ), 
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 16),
              child: AllText(text: text),
            )
          ],
        ),
      ),
    );
  }
}