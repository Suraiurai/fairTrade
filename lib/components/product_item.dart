import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String txt;
  final String image;
  final String price;
  final VoidCallback? onTap;
  const ProductItem({super.key, required this.txt, this.onTap, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 223,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 167,
            decoration: BoxDecoration(
              color: AppColors.light200,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: Image(image: AssetImage("assets/icons/$image.png"))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AllText(text: price, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AllText(text: txt, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
