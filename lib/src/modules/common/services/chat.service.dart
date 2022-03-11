import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:com.aziznal.whatsapp_clone/src/modules/main_chat_list/constants/main-chat-list.api-definition.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/mock/mock_data.dart';

// TODO: convert to GetXService

class ChatService {
  // Example of a function that can be made using http client
  // ignore: unused_element
  static Future<List<Chat>> _getAllChatsHttp() async {
    return http.get(Uri.parse(MainChatListApi.getAllChats)) as List<Chat>;
  }

  // TODO: add method for getting all contacts

  // Returns all available chats
  static Future<List<Chat>> getAllChats() {
    return Future<List<Chat>>.delayed(
      Duration(seconds: 2),
      () => MockData.chats,
    );
  }

  /// Adds new chat to chat list
  static Future addNewChat(Chat newChat) {
    return Future.delayed(Duration(seconds: 1), () {
      MockData.chats.add(newChat);
    });
  }
}
