import 'package:flutter/material.dart';

void AlertBox({required BuildContext context, required Widget child, bool insetPadding = false, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center, bool dismissible = true})
{
  showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Dialog(
              insetPadding: insetPadding == true ? EdgeInsets.all(0) : null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              child: child,
            ),
          ],
        );
      });
}