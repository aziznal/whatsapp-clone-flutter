import 'package:flutter/material.dart';

import 'package:com.aziznal.whatsapp_clone/src/utils/extensions/padding_between_items.extension.dart';

/// Basic loading spinner that shows text above the spinner
class CustomLoadingSpinner extends StatelessWidget {
  final String loadingText;

  const CustomLoadingSpinner({
    Key? key,
    this.loadingText = 'Loading...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(loadingText),
          CircularProgressIndicator(),
        ].addBottomPadding(24),
      ),
    );
  }
}
