import 'package:com.aziznal.whatsapp_clone/src/utils/utils.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/message.model.dart';

class Chat {
  late final String id;
  final Contact contact;
  final List<Message> messages;

  Chat({
    required this.contact,
    required this.messages,
  }) {
    id = Utils.generateRandomId();
  }
}
