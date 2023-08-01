import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/message.dart';
import 'package:flutter_application_2/presentation/providers/chat_provider.dart';
import 'package:flutter_application_2/presentation/widgets/chat/my_message_bubble.dart';
import 'package:provider/provider.dart';

import '../../widgets/chat/person_message_bubble.dart';
import '../../widgets/shared/input_text_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(9.0),
          child: CircleAvatar(backgroundImage: NetworkImage('https://i.pinimg.com/736x/bc/08/5f/bc085f73b3d711c3849bdaf6cba70e04.jpg'),),
        ),
        title: const Text('Messi', style: TextStyle(fontSize: 20),),
      ),
      body: const ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.scrollController,
              itemBuilder: (context,index){
              return (chatProvider.messages[index].fromWho == FromWho.person)
              ? PersonMessageBubble(message: chatProvider.messages[index])
              : MyMessageBubble(message: chatProvider.messages[index]);
            },
            itemCount: chatProvider.messages.length,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
              child: InputTextBox(
                onValue: chatProvider.sendMessage
              ),
            )
          ],
        ),
      ),
    );
  }
}