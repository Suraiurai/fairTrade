import 'package:dubai_project/components/header.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/assets.dart';
import 'package:flutter/material.dart';

import '../../components/product_proof_button.dart';
import '../../components/setting_button.dart';

class ProfileScreen extends StatelessWidget {
  final ScrollController controller;
  const ProfileScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  controller: controller,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AppIcons.profile.svgPicture(),
                    ),
                    const Center(
                        child: AllText(
                      text: "Yhlas Kerimov",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    )),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: AllText(
                          text: "Settings", fontWeight: FontWeight.bold),
                    ),
                    SettingButton(text: "General", onTap: () {}),
                    const SizedBox(height: 10),
                    SettingButton(
                        text: "Language", subText: '(English)', onTap: () {}),
                    const SizedBox(height: 10),
                    SettingButton(
                        text: "Favourite markets and products", onTap: () {}),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 14, top: 40),
                      child: AllText(
                          text: "Product Proof", fontWeight: FontWeight.bold),
                    ),
                    ProductProofButton(
                      text: 'Check Receipt',
                      icon: AppIcons.scan.svgPicture(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Header()
      ],
    );
  }
}
