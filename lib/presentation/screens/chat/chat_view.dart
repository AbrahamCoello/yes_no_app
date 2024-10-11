import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.separated(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
              itemBuilder: (BuildContext context, int index) {
                final Message message = chatProvider.messages[index];
                return message.fromWho == FromWho.other
                    ? HerMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            MessageFieldBox(
              onValueSubmitted: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
