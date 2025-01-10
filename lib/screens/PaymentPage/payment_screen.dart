import 'package:dubai_project/components/pay_button.dart';
import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.only(top: 60),
            child: Center(child: AllText(text: "Payment method")),
          )),
          AllText(text: "Select  your payment method"),
          SizedBox(height: 20),
          PayButton(icon: "paypal", text: "Paypal"),
          SizedBox(height: 10),
          PayButton(icon: "paypal", text: "Credit Card"),
          SizedBox(height: 10),
          PayButton(icon: "paypal", text: "Apple Pay"),
          SizedBox(height: 10),
          PayButton(icon: "paypal", text: "Google Pay"),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: ListView(
          //       children: const [
          //          AllText(text: "Select  your payment method"),
          //          PayButton(icon: "paypal", text: "Paypal"),
          //          SizedBox(height: 10),
          //          PayButton(icon: "paypal", text: "Credit Card"),
          //          SizedBox(height: 10),
          //          PayButton(icon: "paypal", text: "Apple Pay"),
          //          SizedBox(height: 10),
          //          PayButton(icon: "paypal", text: "Google Pay")
          //       ],
          //     ),
          //   ),
          // ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Center(
              child: Container(
                width: 166,
                height: 58,
                decoration: BoxDecoration(
                  color: AppColors.p1,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: AllText(
                    text: "Continue",
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: AppColors.whiteCustom,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
