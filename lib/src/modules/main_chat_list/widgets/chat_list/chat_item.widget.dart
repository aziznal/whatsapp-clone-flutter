import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart'
    as route;
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

/// Widget that displays a chat item in the form of a card
/// 
/// Includes the image, name, and last message of the contact of the given [chat]
class ChatItemWidget extends StatefulWidget {
  final Chat chat;

  const ChatItemWidget({
    required this.chat,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatItemWidget> createState() => _ChatItemWidgetState();

  foo() {}
}

class _ChatItemWidgetState extends State<ChatItemWidget> {
  /// This variable controls whether the widget is visible
  ///
  /// This is changed in the [_animateIn] method
  late var opacity = 0.0;

  _ChatItemWidgetState() {
    _animateIn();
  }

  /// Animates chat item card in using a fade-in effect
  void _animateIn() {
    // This timer represents the delay BEFORE the animation starts
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      // This duration is how long the animation will take
      duration: Duration(milliseconds: 200),
      opacity: opacity,
      child: _createChatBody(context),
    );
  }

  Widget _createChatBody(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _createImageWidget(context),
            _createTitleAndSubtitle(),
          ],
        ),
      ),
      onTap: () {
        _gotoChatScreen();
      },
      splashColor: const Color.fromARGB(255, 136, 136, 136),
    );
  }

  Widget _createTitleAndSubtitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.chat.contact.name,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.chat.messages.isNotEmpty ? widget.chat.messages.last.body : '',
        ),
      ].addVerticalPadding(2),
    );
  }

  Widget _createImageWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: 60,
        margin: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
          child: Image.asset(widget.chat.contact.imageAssetPath),
        ),
      ),
      onTap: () => showComingSoonSnackBar(context),
    );
  }

  /// Navigates to chat screen for the current [widget.chat]
  void _gotoChatScreen() {
    Get.toNamed(route.ScreenRoutes.chat.withChatId(widget.chat.id));
  }
}
