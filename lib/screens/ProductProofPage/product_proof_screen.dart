import 'package:dubai_project/components/header.dart';
import 'package:dubai_project/components/product_proof_button.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:flutter/material.dart';

class ProductProof extends StatelessWidget {
  final ScrollController controller;
  const ProductProof({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const AllText(text: "Product Proof", fontWeight: FontWeight.bold),
              const SizedBox(height: 20),
              ProductProofButton(
                  text: 'Check Receipt', icon: AppIcons.scan.svgPicture(), onTap: () {  },),
              const SizedBox(height: 10),
              ProductProofButton(
                  text: "Go to Store with discount",
                  icon: AppIcons.f.svgPicture(), onTap: () {  },)
            ],
          ),
        ),
        const Header()
      ],
    );
  }
}
