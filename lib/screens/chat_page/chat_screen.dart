import 'package:dubai_project/components/message_TF.dart';
import 'package:dubai_project/components/message_widget.dart';
import 'package:dubai_project/models/message.dart';
import 'package:dubai_project/utilities/theme.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MessageTextField(),
      body: Column(
        children: [
          Expanded(
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.whiteCustom
                ),
            child: ListView.separated(
                itemBuilder: (context, index) => MessageBubblState(
                    message: messages[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: messages.length),
          ))
        ],
      ),
    );
  }
}
