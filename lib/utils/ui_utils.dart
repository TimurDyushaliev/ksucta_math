import 'package:flutter/material.dart';

void showResultDialog(
  BuildContext context,
  bool result, {
  VoidCallback? onDismiss,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: result
              ? const Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 60,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 60,
                ),
        ),
      );
    },
  );
  Future.delayed(const Duration(seconds: 1), () {
    Navigator.pop(context);
    onDismiss?.call();
  });
}
