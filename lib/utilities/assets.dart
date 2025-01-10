import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppIcons {
  searchTab('search'),
  searchSelectedTab("search_selected"),
  homeTab("home"),
  homeSelectedTab("home_selected"),
  messageTab("help_center"),
  messageSelectedTab("help_center_active"),
  profileTab("profile"),
  profileSelectedTab("profile_selected"),
  findonMap("find_on_map"),
  arrowRight("arrow_def_right"),
  mark("mark"),
  walmart("walmart"),
  kroger("kroger"),
  shop("shop"),
  shopText("shop_rectangle"),
  chocolate("chocolate"),
  banana("banana"),
  coffee("coffe_bean"),
  cotton("cotton"),
  sugar("sugar"),
  bag("shopping_bag 1"),
  f("Layer_1_f"),
  fInactive("f_fair_inactive"),
  woman("womenImg"),
  arrow("arrow"),
  scan("Scan"),
  profile("profile_fair"),
  heartActive("heart_active"),
  heartInactive("heart_inactive"),
  benandJerry("ben&jerry"),
  contactUs("contact_us"),
  barcode("barcode")


  ;

  final String path;

  const AppIcons(this.path);

  String get _svg => 'assets/icons/$path.svg';

  String get _png => 'assets/icons/$path.png';

  String get _jpg => 'assets/icons/$path.jpg';

  Widget svgPicture({
    double? height,
    double? width,
    Color? color,
  }) =>
      SvgPicture.asset(
        _svg,
        height: height,
        width: width,
        color: color,
      );

  Widget get pngPicture => Image.asset(_png);

  Widget get jpgPicture => Image.asset(_jpg);
}
