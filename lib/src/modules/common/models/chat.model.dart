import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/message.model.dart';

class Chat {
  Chat({
    required this.contact,
    required this.messages,
  });

  final Contact contact;
  final List<Message> messages;
}
