import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoreItem extends StatelessWidget {
  final String icon;
  final String txt;
  final String subtxt;
  final String distance;
  final VoidCallback? onTap;
  const StoreItem(
      {super.key,
      required this.icon,
      required this.txt,
      required this.subtxt,
      this.onTap,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.light100, borderRadius: BorderRadius.circular(80)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                "assets/icons/$icon.svg",
                semanticsLabel: 'Dart Logo',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AllText(text: txt, fontSize: 15, textAlign: TextAlign.left),
                    AllText(
                        text: subtxt,
                        fontSize: 12,
                        color: AppColors.light600,
                        textAlign: TextAlign.left)
                  ],
                ),
              ),
            ),
            const Spacer(),
            AllText(text: distance, color: AppColors.p1),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SizedBox(
                   child: AppIcons.arrowRight.svgPicture()),
            )
          ],
        ),
      ),
    );
  }
}
