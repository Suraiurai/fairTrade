import 'package:flutter/material.dart';

import '../utilities/theme.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
