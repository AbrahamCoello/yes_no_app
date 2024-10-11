import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();
  final List<Message> _messagesList = [];

  List<Message> get messages => _messagesList;

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    _messagesList.add(Message(text: text, fromWho: FromWho.me));
    if (text.contains('?')) {
      getYesNoAnswer();
    }
    notifyListeners();
    moveScrollToEnd();
  }

  Future<void> getYesNoAnswer() async {
    final message = await _getYesNoAnswer.getYesNoAnswer();
    _messagesList.add(message);
    notifyListeners();
    moveScrollToEnd();
  }

  void moveScrollToEnd() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
