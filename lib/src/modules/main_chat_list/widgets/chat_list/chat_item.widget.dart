import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:com.aziznal.whatsapp_clone/src/constants/screen_routes.dart'
    as route;
import 'package:com.aziznal.whatsapp_clone/src/modules/common/models/chat.model.dart';

import 'package:com.aziznal.whatsapp_clone/src/modules/common/widgets/coming_soon_snackbar.widget.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

class ChatItemWidget extends StatefulWidget {
  final Chat chatItemData;

  const ChatItemWidget({
    required this.chatItemData,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatItemWidget> createState() => _ChatItemWidgetState();
}

class _ChatItemWidgetState extends State<ChatItemWidget> {
  late double opacity = 0.0;

  _ChatItemWidgetState() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: opacity,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getImageWidget(context),
              getTitleAndSubtitle(),
            ],
          ),
        ),
        onTap: () {
          gotoChatScreen();
        },
        splashColor: const Color.fromARGB(255, 136, 136, 136),
      ),
    );
  }

  Widget getTitleAndSubtitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.chatItemData.contact.name,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.chatItemData.messages.isNotEmpty
              ? widget.chatItemData.messages.last.body
              : '',
        ),
      ].addVerticalSpacing(2),
    );
  }

  Widget getImageWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: 60,
        margin: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
          child: Image.asset(widget.chatItemData.contact.imageAssetPath),
        ),
      ),
      onTap: () => showComingSoonSnackBar(context),
    );
  }

  void gotoChatScreen() {
    Get.toNamed(route.ScreenRoutes.chat.withChatId(widget.chatItemData.id));
  }
}
