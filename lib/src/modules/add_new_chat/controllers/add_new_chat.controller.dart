import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/controllers/item_list.controller.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/contact.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/services/chat.service.dart';

class ContactItemController extends GetxController {
  /// Navigates to the chat of the given [contact]
  ///
  /// If this given [contact] does not already have a chat, then a new chat is created first.
  gotoChatOfClickedContact(Contact contact) async {
    if (await _chatIsNotAlreadyCreated(contact)) {
      await _createNewChat(contact);
    }

    Chat chat = await ChatService.getChatByContactId(contact.id);

    _gotoChatScreen(chat);
  }

  /// Returns true if no chat exists for the given [contact]
  Future<bool> _chatIsNotAlreadyCreated(Contact contact) async {
    return ChatService.checkContactHasChat(contact.id)
        .then((isChatCreated) => !isChatCreated);
  }

  /// Creates a new chat for the given [contact].
  ///
  /// This will send a post request to save the chat, and also tell the
  /// chat-list controller to add the new created chat
  ///
  /// Warning: This doesn't check whether given contact already has a chat
  Future<void> _createNewChat(Contact contact) async {
    Chat newChat = Chat(
      contact: contact,
      messages: [],
    );

    await ChatService.addNewChat(newChat).then((_) {
      Get.find<ItemListController<Chat>>().addNewObject(newChat);
    });
  }

  /// Navigates to screen of given [chat].
  ///
  /// Warning: This doesn't check if given [chat] exists or not
  void _gotoChatScreen(Chat newChat) {
    Get.offNamed(ScreenRoutes.chat.withChatId(newChat.id));
  }
}
