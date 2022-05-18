import 'package:flutter/foundation.dart' show kIsWeb;
String AssetPath({required String path})
{
  List _path = [];
  if (kIsWeb)
  {
    _path = path.split("/");
    path = _path.getRange(1, _path.length).join("/");
  }

  return path;
}