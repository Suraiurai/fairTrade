import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/screens/MapPage/map_screen.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:dubai_project/utilities/navigation.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_icon_text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: AppColors.p1),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 180,
                        height: 44,
                        child: AllText(
                          text: "Find FareTrade Certified Markets near by you",
                          color: AppColors.whiteCustom,
                          fontSize: 15,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    AppIcons.findonMap.pngPicture,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 90, right: 90),
                      child: RoundedIconTextButton(
                        w: 153,
                        h: 46,
                        icon: AppIcons.arrowRight.svgPicture(),
                        text: "Find On Map",
                        onTap:(){
                           navigateToScreen(context, MapScreen());
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
