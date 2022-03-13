import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/message.model.dart';

class MockData {
  static List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      number: '+00 555 55 555',
      status: 'Yo! I do be utilizing this app tho',
      imageAssetPath: 'assets/images/app-icon.png',
    ),
    Contact(
      name: 'Jane Doe',
      number: '+00 444 44 444',
      status:
          "I have an unnecessarily long status to show people how sophisticated I am, but really I'm quite sad.",
      imageAssetPath: 'assets/images/app-icon.png',
    ),
  ];

  static List<Chat> chats = [
    Chat(
      contact: contacts[0],
      messages: [
        // Message(
        //   body: 'Hey. This is a pretty long message. I sure hope it wont ruin your message box!',
        //   dateSent: DateTime.now(),
        //   sender: MessageSender.self,
        // ),
        Message(
          body: 'Hiya',
          dateSent: DateTime.now().add(Duration(minutes: 2)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'How are you?',
          dateSent: DateTime.now().add(Duration(minutes: 3)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Doing pretty good. And you?',
          dateSent: DateTime.now().add(Duration(minutes: 5)),
          sender: MessageSender.self,
        ),
        Message(
          body: 'Yeah pretty good.',
          dateSent: DateTime.now().add(Duration(minutes: 6)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Just finished making my app!',
          dateSent: DateTime.now().add(Duration(minutes: 7)),
          sender: MessageSender.self,
        ),
        Message(
          body: 'Heck yeah!',
          dateSent: DateTime.now().add(Duration(minutes: 8)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Hey',
          dateSent: DateTime.now(),
          sender: MessageSender.self,
        ),
        Message(
          body: 'Hiya',
          dateSent: DateTime.now().add(Duration(minutes: 2)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'How are you?',
          dateSent: DateTime.now().add(Duration(minutes: 3)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Doing pretty good. And you?',
          dateSent: DateTime.now().add(Duration(minutes: 5)),
          sender: MessageSender.self,
        ),
        Message(
          body: 'Yeah pretty good.',
          dateSent: DateTime.now().add(Duration(minutes: 6)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Just finished making my app!',
          dateSent: DateTime.now().add(Duration(minutes: 7)),
          sender: MessageSender.self,
        ),
        Message(
          body: 'Heck yeah!',
          dateSent: DateTime.now().add(Duration(minutes: 8)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Heck yeah!',
          dateSent: DateTime.now().add(Duration(minutes: 8)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Heck yeah!',
          dateSent: DateTime.now().add(Duration(minutes: 8)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Heck yeah!',
          dateSent: DateTime.now().add(Duration(minutes: 8)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Heck yeah!',
          dateSent: DateTime.now().add(Duration(minutes: 8)),
          sender: MessageSender.other,
        ),
        Message(
          body: 'Heck yeah!',
          dateSent: DateTime.now().add(Duration(minutes: 8)),
          sender: MessageSender.other,
        ),
      ],
    ),
  ];
}
