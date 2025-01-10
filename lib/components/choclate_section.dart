// import 'package:flutter/material.dart';

// import 'product_item.dart';

// class ChocolateSection extends StatelessWidget {
//   const ChocolateSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//       return  SliverGrid(
//                                 gridDelegate:
//                                     SliverGridDelegateWithMaxCrossAxisExtent(
//                                   maxCrossAxisExtent:
//                                       MediaQuery.of(context).size.width / 2,
//                                   mainAxisExtent: 223,
//                                   mainAxisSpacing: 30.0,
//                                   crossAxisSpacing: 22.0,
//                                   childAspectRatio: 1,
//                                 ),
//                                 delegate: SliverChildBuilderDelegate(
//                                   (BuildContext context, int index) {
//                                     return ProductItem(
//                                       txt: snapshot.data![1]['products'][index]
//                                           ["name"],
//                                       image: snapshot.data![1]['products'][index]
//                                           ["image"],
//                                       price: snapshot.data![1]['products'][index]
//                                           ["price"],
//                                       onTap: () {
//                                         ref.read(onItemTappedProvider)(
//                                           panelcontroller,
//                                           ref,
//                                           Pages.productInfo,
//                                           1,
//                                           int.parse(snapshot.data![1]['products']
//                                               [index]["id"]),
//                                         );
//                                       },
//                                     );
//                                   },
//                                   childCount:
//                                       snapshot.data![1]['products'].length,
//                                 ),
//                               );
//   }
// }