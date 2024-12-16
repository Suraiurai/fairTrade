import 'package:dubai_project/components/text.dart';
import 'package:dubai_project/models/message.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class MessageBubblState extends StatelessWidget {
  final Message message;
  const MessageBubblState({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: (message.received ?? false)
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.75, 
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (message.received ?? false)
                      ? AppColors.light200
                      : AppColors.p1,
                ),
                child: AllText(
                  text: message.text ?? "",
                  fontSize: 15,
                  color: (message.received ?? false)
                      ? AppColors.blackCustom
                      : AppColors.whiteCustom,
                ),
              ),
            ]),
      ),
    );
  }
}
