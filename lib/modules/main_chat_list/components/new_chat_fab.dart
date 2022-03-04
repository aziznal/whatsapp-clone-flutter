import 'package:flutter/material.dart';
import 'package:whatsapp_clone/modules/common/components/coming_soon_snackbar.dart';

class NewChatFAB extends StatelessWidget {
  const NewChatFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showComingSoonSnackBar(context),
      child: const Icon(Icons.message),
    );
  }
}
