import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/constants/main-chat-list.api-definition.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/mock/data.mock.dart';

/// Handles communication with chat api
///
/// Note: using mock data at the moment. Still returning [Future] to make api
/// integration easy in the future
class ChatService {
  // Example of a function that can be made using http client
  // ignore: unused_element
  static Future<List<Chat>> _getAllChatsHttp() async {
    return http.get(Uri.parse(MainChatListApi.getAllChats)) as List<Chat>;
  }

  /// Returns all available chats
  /// 
  /// Warning: has not been tested to see what happens if no chats are available
  static Future<List<Chat>> getAllChats() {
    return Future<List<Chat>>.delayed(
      Duration(seconds: 2),
      () => MockData.chats,
    );
  }

  /// Adds new chat associated with the contact information included in the given [newChat] object
  ///
  /// Warning: Does not handle already existing chats. This will most likely
  /// create duplicate chats for the same contact if called twice.
  static Future addNewChat(Chat newChat) {
    return Future.delayed(
      Duration(milliseconds: 350),
      () {
        MockData.chats.add(newChat);
      },
    );
  }

  /// Returns true if contact with given [contactId] already has an active chat
  /// 
  /// Warning: Does not handle non-existing contacts.
  static Future<bool> checkContactHasChat(String contactId) {
    return Future.delayed(Duration(milliseconds: 350), () {
      return MockData.chats.any((chat) => chat.contact.id == contactId);
    });
  }

  /// Returns the chat for the given [contactId]
  /// 
  /// Warning: Does not handle non-existing chats.
  static Future<Chat> getChatByContactId(String contactId) {
    return Future.delayed(Duration(milliseconds: 350), () {
      return MockData.chats.firstWhere((chat) => chat.contact.id == contactId);
    });
  }

  /// Returns chat by given [chatId].
  /// 
  /// Warning: Does not handle non-existing chats.
  static Future<Chat> fetchChatById(String chatId) async {
    return Future.delayed(Duration(milliseconds: 350), () {
      return MockData.chats.firstWhere((chat) => chat.id == chatId);
    });
  }
}
