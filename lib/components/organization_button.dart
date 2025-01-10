import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class OrganizationButton extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  const OrganizationButton({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.light200),
        child: Image(image: AssetImage("assets/icons/$image.png")),
      ),
    );
  }
}
