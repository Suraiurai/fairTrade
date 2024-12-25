import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String txt;
  final VoidCallback? onTap;
  const ProductItem({super.key, required this.txt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 204,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 167,
            decoration: BoxDecoration(
              color: AppColors.light200,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: AppIcons.benandJerry.pngPicture),
          ),
      
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: AllText(text: txt, fontSize: 15, fontWeight: FontWeight.w500,),
          )
        ],
      ),
    );
  }
}
