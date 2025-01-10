import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final String icon;
  final String text;
  const PayButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: AppColors.light100, borderRadius: BorderRadius.circular(80)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: AppColors.light200,
                  borderRadius: BorderRadius.circular(16)),
              child: Center(child: Image(image: AssetImage("assets/icons/$icon.png"))),
            ),
            const SizedBox(width: 16),
            AllText(text: text)
          ],
        ),
      ),
    );
  }
}
