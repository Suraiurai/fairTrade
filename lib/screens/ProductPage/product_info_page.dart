import 'package:dubai_project/components/header.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class ProductInfoScreen extends StatelessWidget {
  final ScrollController controller;
  const ProductInfoScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      AppIcons.walmart.svgPicture(),
                      Column(
                        children: [
                          AllText(
                            text: "Walmart",
                            fontSize: 20,
                          ),
                          Spacer(),
                          AllText(
                            text: "Sydney Johnson, 800 Ocean Avenuea",
                            fontSize: 15,
                            color: AppColors.light600,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            ),
          ],
        ),
           Header(),
      ],
    );
  }
}
