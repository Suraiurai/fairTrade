import 'package:dubai_project/components/header.dart';
import 'package:dubai_project/components/store_item.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/screens/MapPage/map_vm.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/enums.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/home_vm.dart';

class PanelWidget extends ConsumerWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonLoader = ref.read(jsonLoaderProvider);

    final futureData =
        jsonLoader.loadJsonFromAssets('assets/jsons/home_stores.json', ref);

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 40),
                    ),
                    SliverToBoxAdapter(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AllText(
                            text: "Story of the Day",
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                       GestureDetector(
                        onTap: () {
                             ref.read(onItemTappedProvider)(
                                          panelController,
                                          controller,
                                          ref,
                                          Pages.storyOfTheDay,
                                          0, 0);
                        },
                        child:  Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 40),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: AppIcons.woman.pngPicture,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16)),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        AppColors.blackCustom,
                                        Color.fromARGB(0, 0, 0, 0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 13, left: 14),
                                  child: SizedBox(
                                    height: 40,
                                    width: 236,
                                    child: AllText(
                                      text:
                                          "Fairtrade, and ECOOKIM partner to raise farmer incomes",
                                      color: AppColors.whiteCustom,
                                      fontSize: 15,
                                      maxLine: 2,
                                      fontWeight: FontWeight.bold,
                                    
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                       )
                      ],
                    )),
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
                    FutureBuilder<List<dynamic>>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return SliverToBoxAdapter(
                            child: Center(
                              child: Text('Error: ${snapshot.error}'),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: index == snapshot.data!.length - 1
                                        ? 90.0
                                        : 0.0,
                                    top: 10,
                                  ),
                                  child: StoreItem(
                                    icon: snapshot.data![index]['icon'],
                                    txt: snapshot.data![index]['market_name'],
                                    subtxt: snapshot.data![index]['address'],
                                    onTap: () {
                                      ref.read(onItemTappedProvider)(
                                          panelController,
                                          controller,
                                          ref,
                                          Pages.storeInfo,
                                          int.parse(
                                              snapshot.data![index]['id']), 0);
                                    },
                                    distance: snapshot.data![index]['distance'],
                                  ),
                                );
                              },
                              childCount: snapshot.data!.length,
                            ),
                          );
                        } else {
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: Text('No data found'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Header(),
      ],
    );
  }
}
