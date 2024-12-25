import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
        Positioned(
          top: 20,
          left: MediaQuery.of(context).size.width / 2 - 17.5,
          child: Container(
            width: 35.0,
            height: 5.0,
            decoration: const BoxDecoration(
              color: AppColors.light600,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ],
    );
  }
}
