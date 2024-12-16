import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  final Widget icon;
  final String txt;
  final String subtxt;
  final VoidCallback? onTap;
  const ProductCategory(
      {super.key, required this.icon, required this.txt, required this.subtxt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.light100, borderRadius: BorderRadius.circular(80)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: icon,
            ),
             Padding(
              padding: const EdgeInsets.only(left: 20, right: 32),
              child: SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AllText(
                        text: txt, fontSize: 15, textAlign: TextAlign.left),
                     AllText(
                        text: subtxt,
                        fontSize: 12,
                        color: AppColors.light600,
                        textAlign: TextAlign.left)
                  ],
                ),
              ),
            ),
            const AllText(text: "20m", color: AppColors.p1),
            SizedBox(
                width: 32, height: 32, child: AppIcons.arrowRight.svgPicture())
          ],
        ),
      ),
    );
  }
}
