import 'package:com.aziznal.whatsapp_clone/src/utils/utils.dart';

enum MessageSender { self, other }

class Message {
  late final String id;
  final String body;
  final DateTime dateSent;
  final MessageSender sender;

  Message({
    required this.body,
    required this.dateSent,
    required this.sender,
  }) {
    id = Utils.getRandomUuid();
  }
}
