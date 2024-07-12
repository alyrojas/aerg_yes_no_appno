import 'package:flutter/material.dart';
import 'package:jamb_yes_no_app/domain/entities/message.dart';
import 'package:jamb_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:jamb_yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:jamb_yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:jamb_yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _ChatView(),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://storage.ko-fi.com/cdn/useruploads/display/271a4e0e-9d60-4b63-837f-c4c9d79d3824_sage.jpg'),
          ),
        ),
        title: const Text('Usuario'),
        centerTitle: false,
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.her)
                    ? const MyMessages()
                    : const HerMessages();
              },
            )),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
