import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siteco_external/Consts/colors/colors.dart';

void iDCopied({required BuildContext context})
{
  var snackBar = SnackBar(duration: Duration(milliseconds: 1500), backgroundColor: grey, content: Text("Project's ID copied to the clipboard"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

//function for regexp in the text field
List inputRegex({required Map expressions})
{
  List regexp = [];
  for(var entry in expressions.entries)
  {
    if(entry.key.toLowerCase() == 'allow')
    {
      regexp.add(FilteringTextInputFormatter.allow(RegExp(entry.value)));
    }
    else
    {
      regexp.add(FilteringTextInputFormatter.deny(RegExp(entry.value)));
    }
  }
  return regexp;
}