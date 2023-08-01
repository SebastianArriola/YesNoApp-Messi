import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/message.dart';

class PersonMessageBubble extends StatelessWidget {
  const PersonMessageBubble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: colors.tertiary, borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.message, style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 7.5,),
        _ImageMsg(url: message.urlImg,),
        const SizedBox(height: 7.5,)
      ],
    );
  }
}

class _ImageMsg extends StatelessWidget {

  final String url;

  const _ImageMsg({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(url, width: size.width * 0.7, fit: BoxFit.cover, height: 170,
      loadingBuilder: (context, child, loadingProgress) {
            if(loadingProgress == null){
              return child;
            }
            return Container(
              height: 170,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('La imagen esta cargando...')
            );
      },),);
  }
}