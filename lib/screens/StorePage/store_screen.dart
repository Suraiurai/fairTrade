import 'package:dubai_project/components/header.dart';
import 'package:dubai_project/components/product_category.dart';
import 'package:dubai_project/components/search_button.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/screens/MapPage/map_vm.dart';
import 'package:dubai_project/screens/StorePage/store_vm.dart';
import 'package:dubai_project/utilities/enums.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../components/product_item.dart';
import '../HomePage/controllers/home_vm.dart';

class StoreScreen extends ConsumerWidget {
  final ScrollController controller;
  final PanelController panelController;
  final int id;
  const StoreScreen({
    super.key,
    required this.controller,
    required this.panelController,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonLoader = ref.read(jsonLoaderProvider);

    final futureData =
        jsonLoader.loadJsonFromAssets('assets/jsons/store_info.json', ref);

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            FutureBuilder<List<dynamic>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ref.read(dataLoaded.notifier).update((state) => true);
                    return Expanded(
                      child: CustomScrollView(
                        controller: controller,
                        slivers: [
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 40),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            sliver: SliverToBoxAdapter(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/shop_rectangle.svg"),
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
                                              text: snapshot.data![id]
                                                  ['market_name']),
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
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            sliver: SliverToBoxAdapter(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: SizedBox(
                                  child: AllText(
                                      maxLine: 10,
                                      text: snapshot.data![id]['description']),
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 20),
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
                                    itemCount:
                                        snapshot.data![id]["category"].length,
                                    itemBuilder: (context, index) => Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 6),
                                          child: ProductCategory(
                                            text: snapshot.data![id]["category"]
                                                [index]["name"],
                                            icon: snapshot.data![id]["category"]
                                                [index]["icon"],
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
                                height: 3,
                                decoration: BoxDecoration(
                                    color: AppColors.light200,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 30),
                                  child: AllText(
                                      text: "Products",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
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
                                            isActive:
                                                ref.watch(productIndex) == index
                                                    ? true
                                                    : false,
                                            onTap: () {
                                              ref
                                                  .read(productIndex.notifier)
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
                            padding: const EdgeInsets.only(
                                top: 40, left: 19.5, right: 19.5, bottom: 100),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent:
                                    MediaQuery.of(context).size.width / 2,
                                mainAxisExtent: 223,
                                mainAxisSpacing: 30.0,
                                crossAxisSpacing: 22.0,
                                childAspectRatio: 1,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return ProductItem(
                                    txt: snapshot.data![id]['products'][index]
                                        ["name"],
                                    image: snapshot.data![id]['products'][index]
                                        ["image"],
                                    price: snapshot.data![id]['products'][index]
                                        ["price"],
                                  );
                                },
                                childCount:
                                    snapshot.data![id]['products'].length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                }),
          ],
        ),
        const Header()
      ],
    );
  }
}
