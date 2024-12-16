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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 35.0,
            height: 5.0,
            decoration: const BoxDecoration(
              color: AppColors.light600,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
        Expanded(
          child: ListView(
              controller: widget.controller,
              padding: EdgeInsets.zero,
              children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 40, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.light100,
                          borderRadius: BorderRadius.circular(100)),
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: AppColors.light600),
                            prefixIcon: Icon(Icons.search, color: AppColors.light600,),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14)),
                        onChanged: (text) {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      itemCount: SearchButtons.values.length,
                    ),
                  )
                ]),
              ]),
        ),
      ],
    );
  }
}
