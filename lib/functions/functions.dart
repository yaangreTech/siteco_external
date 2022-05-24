import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//function for regexp in the text field
List inputRegex({required Map expressions})
{
  List regexp = [];
  for(var entry in expressions.entries)
  {
    if(entry.value.toLowerCase() == 'allow')
    {
      regexp.add(FilteringTextInputFormatter.allow(RegExp(entry.key)));
    }
    else
    {
      regexp.add(FilteringTextInputFormatter.deny(RegExp(entry.key)));
    }
  }
  return regexp;
}

void printObject(Object object) {
  // Encode your object and then decode your object to Map variable
  Map jsonMapped = json.decode(json.encode(object));

  // Using JsonEncoder for spacing
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');

  // encode it to string
  String prettyPrint = encoder.convert(jsonMapped);

  // print or debugPrint your object
  debugPrint(prettyPrint);
}