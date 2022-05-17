import 'package:flutter/material.dart';

Widget RedElevatedButton({required Widget child, Function? onPressed})
{
  return ElevatedButton(onPressed: ()
  {
    onPressed?.call();
  }, child: child, style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
    topRight: Radius.circular(0),
    topLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  ))));
}