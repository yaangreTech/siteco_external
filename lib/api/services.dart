import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Map<String, String> _headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};


const String root = "http://ytech-bf.com/siteco/public/api/";

class Services {
  static const root = "http://ytech-bf.com/siteco/public/api/";

  static Future getData({Map<String, dynamic> data = const {}, required String apiURL, bool isGet = true}) async
  {
    try
    {
      String finalURL = root + apiURL;
      final response = isGet
          ? await http.get(Uri.parse(finalURL), headers: _headers)
          : await http.post(Uri.parse(finalURL),
              body: json.encode(data), headers: _headers);
      // print(response.body);
      if (response.statusCode == 200)
      {
        Map data = {'status': '200', 'data': json.decode(response.body)};
        return data;
      }
      else
      {
        Map data = {'status': '400', 'data': json.decode('')};
        return data;
      }
    }
    catch (e)
    {
      Map data = {'status': '500', 'data': json.decode('')};
      return data;
    }
  }
}


void getData({required Function callback, required String url}) async
{
  Response response = await get(Uri.parse(url));
  callback(jsonDecode(response.body));
}