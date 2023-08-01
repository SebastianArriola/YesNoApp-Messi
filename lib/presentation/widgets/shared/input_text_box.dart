import 'package:flutter/material.dart';

class InputTextBox extends StatelessWidget {
  const InputTextBox({super.key, required this.onValue});

  final ValueChanged<String> onValue; 

  @override
  Widget build(BuildContext context) {

    final outlineInputBorder = UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none
        );

    final textController = TextEditingController();

    final focusNode = FocusNode();

    return TextField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      controller: textController,
      focusNode: focusNode,
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        hintText: 'Escriba un mensaje',
        suffixIcon: IconButton(icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final value = textController.value.text;
          onValue(value);
          focusNode.requestFocus();
          textController.clear();
        },),
        filled: true
      ),
      onSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}