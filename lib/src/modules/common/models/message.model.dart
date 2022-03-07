enum MessageSender { self, other }

class Message {
  Message({
    required this.body,
    required this.dateSent,
    required this.sender,
  });

  final String body;
  final DateTime dateSent;
  final MessageSender sender;
}
