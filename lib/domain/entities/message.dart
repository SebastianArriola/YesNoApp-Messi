enum FromWho {person, me}

class Message{

  final String message;
  final String urlImg;
  final FromWho fromWho;

  Message({required this.message, this.urlImg = '', required this.fromWho});

}