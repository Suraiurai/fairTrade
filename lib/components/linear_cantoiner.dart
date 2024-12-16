import 'package:flutter/material.dart';

class LinearContainer extends StatelessWidget {
  const LinearContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      height: 260, 
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromRGBO(255, 255, 255, 0)],
          ),
        ),
      ),
    );
  }
}
