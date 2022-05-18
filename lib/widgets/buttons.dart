import 'package:flutter/material.dart';
import 'package:siteco_external/colors/colors.dart';

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

Widget RedOutlinedButton({required Widget child, Function? onPressed})
{
  return OutlinedButton(
  onPressed: ()
  {
    onPressed?.call();
  },
  child: child,
  style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
    topRight: Radius.circular(0),
    topLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  )), side: BorderSide(width: 1.0, color: red)));
}