import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValueSubmitted;
  const MessageFieldBox({super.key, required this.onValueSubmitted});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    const outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide.none,
    );
    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'Escribe un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final value = textController.text;
          textController.clear();
          onValueSubmitted(value);
        },
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        print('Tapped outside');
        focusNode.unfocus();
      },
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValueSubmitted(value);
      },
    );
  }
}
