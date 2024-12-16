import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteCustom,
      padding:  EdgeInsets.only(bottom: (MediaQuery.of(context).viewInsets.bottom + 20), left: 20, right: 20, top: 10),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.light100,
        ),
        child: const Row(
          children: [
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Enter Your Message"),
            ))
          ],
        ),
      ),
    );
  }
}
