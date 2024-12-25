import 'package:dubai_project/components/header.dart';
import 'package:dubai_project/components/product_item.dart';
import 'package:dubai_project/components/search_button.dart';
import 'package:dubai_project/utilities/enums.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final ScrollController controller;
  const SearchScreen({super.key, required this.controller});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int currentInx = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 22),
            Expanded(
              child: CustomScrollView(
                controller: widget.controller,
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 140),
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
                                  isActive: currentInx == index ? true : false,
                                  onTap: () {
                                    setState(() {
                                      currentInx = index;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 40, left: 19.5, right: 19.5),
                    sliver: SliverGrid(
                      gridDelegate:
                          SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                        mainAxisExtent: 204,
                        mainAxisSpacing: 30.0,
                        crossAxisSpacing: 22.0,
                        childAspectRatio: 1,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ProductItem(txt: "Ben & Jerry’s");
                        },
                        childCount: 20,
                      ),
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 20, right: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.light100,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: AppColors.light600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.light600,
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        ),
                        onChanged: (text) {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
