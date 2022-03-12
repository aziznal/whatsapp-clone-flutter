import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/list.extensions.dart';

// TODO: add param for loading text

class CustomLoadingSpinner extends StatelessWidget {
  const CustomLoadingSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Loading Chats...'),
          CircularProgressIndicator(),
        ].addBottomPadding(24),
      ),
    );
  }
}
