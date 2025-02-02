import 'package:flutter/material.dart';

class CustomSnackBarShared {
  static void show(ScaffoldMessengerState messenger, String message,
      {String? additionalInfo}) {
    messenger.showSnackBar(
      SnackBar(
        showCloseIcon: true,
        duration: Duration(milliseconds: 2000),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            if (additionalInfo != null) Text(additionalInfo),
          ],
        ),
      ),
    );
  }
}
