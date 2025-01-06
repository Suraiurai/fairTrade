import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../components/header.dart';

class StoryOfTheDay extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const StoryOfTheDay({
    super.key,
    required this.controller,
    required this.panelController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                // Ensures the scrollable area can expand
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: AllText(
                              text: "Story of the Day",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Center(child: AppIcons.woman.pngPicture),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: AllText(
                              text:
                                  "Fairtrade, Mars and ECOOKIM partner to raise farmer incomes",
                              fontSize: 20,
                              maxLine: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const AllText(
                            text:
                                """By Taryn Holland, Head of Programmes at Fairtrade Foundation
Today, Mars, Fairtrade and ECOOKIM – a collection of cocoa farming co-operatives in Côte d’Ivoire – announced plans to deepen their partnership, through an innovative 10m program to raise farmer incomes. This programme is novel, experimental and ambitious – it’s also urgently needed.

Because no two farmers are the same, the LEAP approach will support different types of farmers with tailored packages to move towards a living income, regardless of their starting position. This means developing bespoke support for farming families depending on individual farm size, productivity levels, and income earned from beyond cocoa farming. We want to meet farmers like Mile and Digbeu where they’re at, rather than providing one-size-fits-all solutions.""",
                            maxLine: 100,
                          ),
                        ],
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Header(),
        Positioned(
          bottom: 100,
          left: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 72,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.p1,
                borderRadius: BorderRadius.circular(80),
                // boxShadow: [
                //   const BoxShadow(
                //     color: AppColors.whiteCustom,
                //   ),
                //   const BoxShadow(
                //     color: AppColors.light400,
                //     spreadRadius: -100.0,
                //     blurRadius: 12.0,
                //   ),
                // ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    AllText(
                      text: "Donate",
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteCustom,
                      fontSize: 15,
                    ),
                    const Spacer(),
                    AppIcons.arrow.svgPicture(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
