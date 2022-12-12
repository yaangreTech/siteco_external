import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/colors/colors.dart';

void iDCopied({required BuildContext context})
{
  var snackBar = SnackBar(duration: Duration(milliseconds: 1500), backgroundColor: grey, content: Text("Project's ID copied to the clipboard"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}