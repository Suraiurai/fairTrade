import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/header.dart';
import '../../components/product_proof_button.dart';
import '../../components/text.dart';

class AIHelperScreen extends StatelessWidget {
  const AIHelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const AllText(text: "Help Center", fontWeight: FontWeight.bold),
              const SizedBox(height: 20),
              ProductProofButton(
                  text: 'Scan barcode', icon: SvgPicture.asset("assets/icons/barcode.svg"), onTap: () {  },),
              const SizedBox(height: 10),
              ProductProofButton(
                  text: "Contact Us",
                  icon: SvgPicture.asset("assets/icons/contact_us.svg", color: AppColors.p1,), onTap: () {  },)
            ],
          ),
        ),
        const Header()
      ],
    );
  }
}