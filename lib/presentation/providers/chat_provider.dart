import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_application_2/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController scrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  final List<Message> messages = [
    Message(message: 'Hola messi', fromWho: FromWho.me),
    Message(message: 'Que bien que consegui tu numero', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async{

    if(text.isEmpty) return;

    final message = Message(message: text, fromWho: FromWho.me);
    messages.add(message);
    notifyListeners();
    scrollToEnd();
    if(text.endsWith('?')) messiMessage();
    
  }

  Future<void> messiMessage() async{
    final message = await getYesNoAnswer.getAnswer();
    messages.add(message);
    notifyListeners();
    await scrollToEnd();
  }

  Future<void> scrollToEnd  () async{

    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

  }

}