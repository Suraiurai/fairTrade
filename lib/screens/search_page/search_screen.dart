import 'package:dubai_project/components/TF.dart';
import 'package:dubai_project/components/organization_button.dart';
import 'package:dubai_project/components/search_button.dart';
import 'package:dubai_project/utilities/enums.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../components/product_item.dart';
import '../../components/text.dart';
import '../HomePage/controllers/home_vm.dart';
import '../MapPage/map_vm.dart';
import 'search_vm.dart';

class SearchScreen extends ConsumerWidget {
  final ScrollController controller;
  final PanelController panelcontroller;
  final PageController pagecontroller = PageController();

  SearchScreen({
    Key? key,
    required this.panelcontroller,
    required this.controller,
  }) : super(key: key);

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
    final futureOrganizationsData =
        jsonLoader.loadJsonFromAssets('assets/jsons/organithations.json', ref);

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 22),
            Expanded(
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 20, left: 20, top: 140),
                    sliver: SliverToBoxAdapter(
                        child: AllText(
                      text: "Organizations",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  FutureBuilder<List<dynamic>>(
                      future: futureOrganizationsData,
                      builder: (context, snap) {
                        if (snap.hasData) {
                          return SliverToBoxAdapter(
                            child: SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  itemCount: snap.data!.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: OrganizationButton(
                                          image: snap.data![index]["image"],
                                          onTap: () {
                                            ref.read(onItemTappedProvider)(
                                              panelcontroller,
                                              controller,
                                              ref,
                                              Pages.organizationInfo,
                                              index,
                                              0,
                                            );
                                          },
                                        ),
                                      )),
                            ),
                          );
                        } else {
                          return const SliverToBoxAdapter(
                            child: SizedBox(height: 100),
                          );
                        }
                      }),
                   const SliverPadding(
                    padding: EdgeInsets.only(bottom: 20, left: 20, top: 40),
                    sliver: SliverToBoxAdapter(
                        child: AllText(
                      text: "Products",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SizedBox(
                        height: 38,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: SearchButtons.values.length,
                          itemBuilder: (context, index) => Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: SearchButton(
                                  SearchButtons.values[index].name,
                                  isActive:
                                      ref.watch(curInd) == index ? true : false,
                                  onTap: () {
                                    ref
                                        .read(curInd.notifier)
                                        .update((state) => index);

                                    pagecontroller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)   ; 
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
                                            MediaQuery.of(context).size.width /
                                                crossAxisCount,
                                        mainAxisExtent: itemHeight,
                                        mainAxisSpacing: spacing,
                                        crossAxisSpacing: 22.0,
                                      ),
                                      itemCount: ref.watch(productCount),
                                      itemBuilder: (context, index) {
                                        return ProductItem(
                                          txt: snapshot.data![1]['products']
                                              [index]["name"],
                                          image: snapshot.data![1]['products']
                                              [index]["image"],
                                          price: snapshot.data![1]['products']
                                              [index]["price"],
                                          onTap: () {
                                            ref.read(onItemTappedProvider)(
                                              panelcontroller,
                                              controller,
                                              ref,
                                              Pages.productInfo,
                                              1,
                                              int.parse(snapshot.data![1]
                                                  ['products'][index]["id"]),
                                            );
                                            _scrollToTop();
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
                                        category['name'] == 'Chocolate');
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
                                            MediaQuery.of(context).size.width /
                                                crossAxisCount,
                                        mainAxisExtent: itemHeight,
                                        mainAxisSpacing: spacing,
                                        crossAxisSpacing: 22.0,
                                      ),
                                      itemCount: chocolateProducts.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data![1]['products'][index]
                                                ["category"][0]["name"] ==
                                            'Chocolate') {
                                          return ProductItem(
                                            txt: chocolateProducts[index]
                                                ["name"],
                                            image: chocolateProducts[index]
                                                ["image"],
                                            price: chocolateProducts[index]
                                                ["price"],
                                            onTap: () {
                                              ref.read(onItemTappedProvider)(
                                                panelcontroller,
                                                controller,
                                                ref,
                                                Pages.productInfo,
                                                1,
                                                int.parse(
                                                    chocolateProducts[index]
                                                        ["id"]),
                                              );
                                              _scrollToTop();
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
                                            MediaQuery.of(context).size.width /
                                                crossAxisCount,
                                        mainAxisExtent: itemHeight,
                                        mainAxisSpacing: spacing,
                                        crossAxisSpacing: 22.0,
                                      ),
                                      itemCount: coffeeProducts.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data![1]['products'][index]
                                                ["category"][0]["name"] ==
                                            'Chocolate') {
                                          return ProductItem(
                                            txt: coffeeProducts[index]["name"],
                                            image: coffeeProducts[index]
                                                ["image"],
                                            price: coffeeProducts[index]
                                                ["price"],
                                            onTap: () {
                                              ref.read(onItemTappedProvider)(
                                                panelcontroller,
                                                controller,
                                                ref,
                                                Pages.productInfo,
                                                1,
                                                int.parse(coffeeProducts[index]
                                                    ["id"]),
                                              );
                                              _scrollToTop();
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
                                    (ref.watch(productCount) / crossAxisCount)
                                        .ceil();
                                ref
                                        .read(gridHeight.notifier)
                                        .update((state) => rowCount * 250) +
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
            ),
          ],
        ),
        Positioned(
          top: 110,
          child: Container(
            height: 53,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Color.fromARGB(225, 255, 255, 255),
                  Colors.white54,
                  Color.fromARGB(0, 255, 255, 255),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 1,
          left: MediaQuery.of(context).size.width,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120.0,
            decoration: const BoxDecoration(
              color: AppColors.whiteCustom,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          child: Container(
            decoration: BoxDecoration(color: AppColors.whiteCustom),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 35.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                      color: AppColors.light600,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextFieldCustom(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
