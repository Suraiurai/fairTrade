import 'package:dubai_project/components/product_category.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    SliverToBoxAdapter(child: SizedBox(height: 60),),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: AllText(
                                text: "Nearby markets",
                                fontSize: 16,
                                color: AppColors.blackCustom,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 68,
                              height: 34,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.light100,
                              ),
                              child: const Center(
                                child:
                                    AllText(text: "300M", color: AppColors.p1),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: AllText(text: "Radius"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: index == 9 ? 90.0 : 0.0, top: 10),
                            child: ProductCategory(
                              icon: AppIcons.walmart.svgPicture(),
                              txt: "text",
                              subtxt: 'subtext',
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                       Colors.white,
                      Colors.white,
                      Color.fromARGB(190, 255, 255, 255),
                      Colors.white54,
                      Color.fromARGB(0, 255, 255, 255),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: MediaQuery.of(context).size.width / 2 - 17.5,
                child: Container(
                  width: 35.0,
                  height: 5.0,
                  decoration: const BoxDecoration(
                    color: AppColors.light600,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


              // Container(
              //     height: 260,
              //     width: double.infinity,
              //     decoration: const BoxDecoration(
              //       color: Colors.white,
              //       gradient: LinearGradient(
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         colors: [
              //           Colors.white,
              //           Colors.transparent,
              //         ],
              //       ),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(top: 20, bottom: 10),
              //     child: Container(
              //       width: 35.0,
              //       height: 5.0,
              //       decoration: const BoxDecoration(
              //         color: AppColors.light600,
              //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
              //       ),
              //     ),
              //   ),