import 'package:dubai_project/components/header.dart';
import 'package:dubai_project/components/product_item.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../components/product_category.dart';
import '../../components/store_item.dart';
import '../../utilities/enums.dart';
import '../HomePage/controllers/home_vm.dart';
import '../MapPage/map_vm.dart';
import '../StorePage/store_vm.dart';

class ProductInfoScreen extends ConsumerWidget {
  final int id;
  final int ind;
  final ScrollController controller;
  final PanelController panelcontroller;
  const ProductInfoScreen(
      {super.key,
      required this.id,
      required this.panelcontroller,
      required this.ind,
      required this.controller});

  void _scrollToTop() {
    controller.animateTo(
      0.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonLoader = ref.read(jsonLoaderProvider);

    final futureData =
        jsonLoader.loadJsonFromAssets('assets/jsons/store_info.json', ref);
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 20),
            FutureBuilder<List<dynamic>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: CustomScrollView(
                      controller: controller,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 73,
                                  height: 73,
                                  decoration: BoxDecoration(
                                      color: AppColors.light200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/icons/${snapshot.data![id]["products"][ind]["image"]}.png"),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AllText(
                                          text: snapshot.data![id]['products']
                                              [ind]["name"],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          maxLine: 1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.p1
                                                      .withOpacity(0.05),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          47)),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 4),
                                                child: AllText(
                                                    text: "-15%",
                                                    color: AppColors.p1,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            const SizedBox(width: 18),
                                            const AllText(
                                                text: "150",
                                                color: AppColors.p1,
                                                fontWeight: FontWeight.w600),
                                            const SizedBox(width: 5),
                                            AppIcons.f.svgPicture(
                                                width: 20, height: 20)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: AppIcons.heartActive.svgPicture(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 40),
                                const AllText(
                                  text: "Producer",
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    ref.read(onItemTappedProvider)(
                                      panelcontroller,
                                      controller,
                                      ref,
                                      Pages.organizationInfo,
                                      ind,
                                      0,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 82,
                                    decoration: BoxDecoration(
                                        color: AppColors.light100,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: AppColors.light400,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/icons/${snapshot.data![id]['products'][ind]["organization"]["image"]}.png")),
                                          ),
                                          const SizedBox(width: 17),
                                          AllText(
                                              text: snapshot.data![id]
                                                      ['products'][ind]
                                                  ["organization"]["name"])
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40),
                                  child: AllText(
                                    text:
                                        "Chocolate ice cream with gooey marshmallow swirls, caramel swirls & fudge fish A portion of the royalties from Ben & Jerry’s Phish Food goes toward environmental efforts in Vermont's Lake Champlain Watershed.",
                                    maxLine: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, bottom: 20),
                                child: AllText(
                                  text: "Category",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  itemCount: snapshot
                                      .data![id]['products'][ind]["category"]
                                      .length,
                                  itemBuilder: (context, index) => Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 6),
                                        child: ProductCategory(
                                          text: snapshot.data![id]["products"]
                                              [ind]["category"][index]["name"],
                                          icon: snapshot.data![id]["products"]
                                              [ind]["category"][index]["icon"],
                                          onTap: () {
                                            ref
                                                .read(categoryIndex.notifier)
                                                .update((state) => index);

                                              
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          sliver: SliverToBoxAdapter(
                            child: Container(
                              width: double.infinity,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: AppColors.light200,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                        const SliverPadding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          sliver: SliverToBoxAdapter(
                              child: AllText(
                            text: "Find on this Markets",
                            fontWeight: FontWeight.bold,
                          )),
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
                                      padding: const EdgeInsets.only(
                                          bottom: 10, left: 20, right: 20),
                                      child: StoreItem(
                                        icon: snapshot.data![index]['icon'],
                                        txt: snapshot.data![index]
                                            ['market_name'],
                                        subtxt: snapshot.data![index]
                                            ['address'],
                                        onTap: () {
                                          ref.read(onItemTappedProvider)(
                                              panelcontroller,
                                              controller,
                                              ref,
                                              Pages.storeInfo,
                                              int.parse(
                                                  snapshot.data![index]['id']),
                                              0);
                                        },
                                        distance: snapshot.data![index]
                                            ['distance'],
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
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          sliver: SliverToBoxAdapter(
                            child: Container(
                              width: double.infinity,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: AppColors.light200,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                        const SliverPadding(
                          padding: EdgeInsets.only(bottom: 20, left: 20),
                          sliver: SliverToBoxAdapter(
                              child: AllText(
                            text: "Similar Products",
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 223,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              itemCount: snapshot.data![id]["products"].length,
                              itemBuilder: (context, index) => Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: ProductItem(
                                        txt: snapshot.data![id]["products"]
                                            [index]["name"],
                                        image: snapshot.data![id]["products"]
                                            [index]["image"],
                                        price: snapshot.data![id]["products"]
                                            [index]["price"],
                                        onTap: () {
                                          ref.read(onItemTappedProvider)(
                                            panelcontroller,
                                            controller,
                                            ref,
                                            Pages.productInfo,
                                            id,
                                            int.parse(snapshot.data![id]
                                                ['products'][index]["id"]),
                                          );
                                            
                                        },
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 140),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
        Header(),
      ],
    );
  }
}
