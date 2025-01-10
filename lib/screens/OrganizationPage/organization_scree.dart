import 'package:dubai_project/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../components/TF.dart';
import '../../components/product_item.dart';
import '../../components/search_button.dart';
import '../../components/text.dart';
import '../../utilities/assets.dart';
import '../../utilities/enums.dart';
import '../../utilities/theme.dart';
import '../HomePage/controllers/home_vm.dart';
import '../MapPage/map_vm.dart';
import '../search_page/search_vm.dart';

class OrganizationPage extends ConsumerWidget {
  final ScrollController controller;
  final PanelController panelController;
  final PageController pagecontroller = PageController();
  final int id;
   OrganizationPage(
      {super.key,
      required this.controller,
      required this.panelController,
      required this.id});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonLoader = ref.read(jsonLoaderProvider);

    final futureData =
        jsonLoader.loadJsonFromAssets('assets/jsons/store_info.json', ref);
    final futureOrgData =
        jsonLoader.loadJsonFromAssets('assets/jsons/organithations.json', ref);
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            FutureBuilder<List<dynamic>>(
                future: futureOrgData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: CustomScrollView(
                        controller: controller,
                        slivers: [
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 50),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            sliver: SliverToBoxAdapter(
                              child: Row(
                                children: [
                                  Container(
                                    width: 73,
                                    height: 73,
                                    decoration: BoxDecoration(
                                        color: AppColors.light200,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/icons/${snapshot.data![id]["image"]}.png")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      width: 260,
                                      height: 73,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AllText(
                                              text: snapshot.data![id]["name"]),
                                          const Spacer(),
                                          AllText(
                                              text: snapshot.data![id]
                                                  ['address'],
                                              fontSize: 15,
                                              color: AppColors.light600,
                                              maxLine: 2,
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    ref.read(onItemTappedProvider)(
                                        panelController,
                                        controller,
                                        ref,
                                        Pages.organizationInfo,
                                        0,
                                        0);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, bottom: 40),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: AppIcons.woman.pngPicture,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 20,
                                          right: 20,
                                          child: Container(
                                            height: 120,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(16),
                                                      bottomRight:
                                                          Radius.circular(16)),
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  AppColors.blackCustom
                                                      .withOpacity(0.7),
                                                  Color.fromARGB(0, 0, 0, 0),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          bottom: 0,
                                          left: 33.5,
                                          child: SizedBox(
                                            height: 40,
                                            width: 236,
                                            child: AllText(
                                              text: "Farmers who produce",
                                              color: AppColors.whiteCustom,
                                              fontSize: 15,
                                              maxLine: 2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: AllText(
                                    text:
                                        "From a renovated gas station in Burlington, Vermont, to far-off places with names we sometimes mispronounce, the journey that began in 1978 with 2 guys and the ice cream business they built is as legendary as the ice cream is euphoric.",
                                    maxLine: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 40),
                                  child: GestureDetector(
                                    onTap: () {
                                      ref.read(onItemTappedProvider)(
                                        panelController,
                                        controller,
                                        ref,
                                        Pages.paymentInfo,
                                        0,
                                        0,
                                      );
                                    },
                                    child: Container(
                                      height: 72,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.p1,
                                        borderRadius: BorderRadius.circular(80),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 0,
                                            blurRadius: 10,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  const AllText(
                                                    text: "Donate",
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.whiteCustom,
                                                    fontSize: 15,
                                                  ),
                                                  const Spacer(),
                                                  AppIcons.arrow.svgPicture(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    width: double.infinity,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        color: AppColors.light200,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                                      const SliverPadding(
                            padding: EdgeInsets.only(
                                bottom: 20, left: 20, right: 20),
                            sliver: SliverToBoxAdapter(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AllText(
                                  text: "Products",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30),
                                  child: TextFieldCustom(),
                                )
                              ],
                            )),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.only(bottom: 30),
                            sliver: SliverToBoxAdapter(
                              child: SizedBox(
                                height: 38,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  itemCount: SearchButtons.values.length,
                                  itemBuilder: (context, index) => Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 6),
                                        child: SearchButton(
                                          SearchButtons.values[index].name,
                                          isActive: ref.watch(curInd) == index
                                              ? true
                                              : false,
                                          onTap: () {
                                            ref
                                                .read(curInd.notifier)
                                                .update((state) => index);

                                            pagecontroller.animateToPage(index,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeInOut);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: FutureBuilder<List<dynamic>>(
                              future: futureData,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  int crossAxisCount = 2;
                                  double itemHeight = 223.0;
                                  double spacing = 30.0;

                                  return SizedBox(
                                    height: ref.watch(gridHeight),
                                    child: PageView.builder(
                                      controller: pagecontroller,
                                      itemCount: SearchButtons.values.length,
                                      itemBuilder: (context, pageIndex) {
                                        if (pageIndex == 0) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        crossAxisCount,
                                                mainAxisExtent: itemHeight,
                                                mainAxisSpacing: spacing,
                                                crossAxisSpacing: 22.0,
                                              ),
                                              itemCount:
                                                  ref.watch(productCount),
                                              itemBuilder: (context, index) {
                                                return ProductItem(
                                                  txt: snapshot.data![1]
                                                          ['products'][index]
                                                      ["name"],
                                                  image: snapshot.data![1]
                                                          ['products'][index]
                                                      ["image"],
                                                  price: snapshot.data![1]
                                                          ['products'][index]
                                                      ["price"],
                                                  onTap: () {
                                                    ref.read(
                                                        onItemTappedProvider)(
                                                      panelController,
                                                      controller,
                                                      ref,
                                                      Pages.productInfo,
                                                      1,
                                                      int.parse(
                                                          snapshot.data![1]
                                                                  ['products']
                                                              [index]["id"]),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        } else if (pageIndex == 1) {
                                          List<dynamic> products =
                                              snapshot.data![1]['products'];
                                          List<dynamic> chocolateProducts =
                                              products.where((product) {
                                            List<dynamic> categories =
                                                product['category'];
                                            return categories.any((category) =>
                                                category['name'] ==
                                                'Chocolate');
                                          }).toList();
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        crossAxisCount,
                                                mainAxisExtent: itemHeight,
                                                mainAxisSpacing: spacing,
                                                crossAxisSpacing: 22.0,
                                              ),
                                              itemCount:
                                                  chocolateProducts.length,
                                              itemBuilder: (context, index) {
                                                if (snapshot.data![1]
                                                                ['products']
                                                            [index]["category"]
                                                        [0]["name"] ==
                                                    'Chocolate') {
                                                  return ProductItem(
                                                    txt:
                                                        chocolateProducts[index]
                                                            ["name"],
                                                    image:
                                                        chocolateProducts[index]
                                                            ["image"],
                                                    price:
                                                        chocolateProducts[index]
                                                            ["price"],
                                                    onTap: () {
                                                      ref.read(
                                                          onItemTappedProvider)(
                                                        panelController,
                                                        controller,
                                                        ref,
                                                        Pages.productInfo,
                                                        1,
                                                        int.parse(
                                                            chocolateProducts[
                                                                index]["id"]),
                                                      );
                                                      //  _scrollToTop();
                                                    },
                                                  );
                                                } else {
                                                  return Container();
                                                }
                                              },
                                            ),
                                          );
                                        } else if (pageIndex == 3) {
                                          List<dynamic> products =
                                              snapshot.data![1]['products'];
                                          List<dynamic> coffeeProducts =
                                              products.where((product) {
                                            List<dynamic> categories =
                                                product['category'];
                                            return categories.any((category) =>
                                                category['name'] == 'Coffee');
                                          }).toList();
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        crossAxisCount,
                                                mainAxisExtent: itemHeight,
                                                mainAxisSpacing: spacing,
                                                crossAxisSpacing: 22.0,
                                              ),
                                              itemCount: coffeeProducts.length,
                                              itemBuilder: (context, index) {
                                                if (snapshot.data![1]
                                                                ['products']
                                                            [index]["category"]
                                                        [0]["name"] ==
                                                    'Chocolate') {
                                                  return ProductItem(
                                                    txt: coffeeProducts[index]
                                                        ["name"],
                                                    image: coffeeProducts[index]
                                                        ["image"],
                                                    price: coffeeProducts[index]
                                                        ["price"],
                                                    onTap: () {

                                                      ref.read(
                                                          onItemTappedProvider)(
                                                        panelController,
                                                        controller,
                                                        ref,
                                                        Pages.productInfo,
                                                        1,
                                                        int.parse(
                                                            coffeeProducts[
                                                                index]["id"]),
                                                      );
                                                      //  _scrollToTop();
                                                    },
                                                  );
                                                } else {
                                                  return Container();
                                                }
                                              },
                                            ),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                      onPageChanged: (value) {
                                        ref
                                            .read(curInd.notifier)
                                            .update((state) => value);
                                        if (value == 0) {
                                          ref
                                              .read(productCount.notifier)
                                              .update((state) => 5);
                                        } else if (value == 1) {
                                          ref
                                              .read(productCount.notifier)
                                              .update((state) => 3);
                                        } else if (value == 3) {
                                          ref
                                              .read(productCount.notifier)
                                              .update((state) => 1);
                                        } else {
                                          ref
                                              .read(productCount.notifier)
                                              .update((state) => 1);
                                        }
                                        final int rowCount =
                                            (ref.watch(productCount) /
                                                    crossAxisCount)
                                                .ceil();
                                        ref.read(gridHeight.notifier).update(
                                                (state) => rowCount * 250) +
                                            ((rowCount - 1) * spacing);
                                      },
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 100),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                })
          ],
        ),
        Header()
      ],
    );
  }
}
