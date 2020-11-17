import 'dart:convert';

import 'package:http/http.dart' as http;

class GetDataFromHttp {
  static Future<dynamic> apiHit(String url, Map<String, dynamic> params) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    print('url: $url');
    print('params: $params');

    var response =
        await http.post(url, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      print('response: ${(response.body)}');
      return json.decode(response.body);
    } else {
      print('error: ${response.statusCode}');
      print('error body: ${response.body}');
      throw Exception('Failed to save time card shift details');
    }
  }

  static Future<dynamic> apiPostWithoutParam(String url) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    print('url: $url');

    var response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      // print('response: ${json.decode(response.body)}');
      return json.decode(response.body);
    } else {
      print('error: ${response.statusCode}');
      print('error body: ${response.body}');
      throw Exception('Failed to send post response');
    }
  }

  static Future<dynamic> apiGet(String url) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    print('url: $url');

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      print('response: ${json.decode(response.body)}');
      return json.decode(response.body);
    } else {
      print('error: ${response.statusCode}');
      print('error body: ${response.body}');
      throw Exception('Failed');
    }
  }
}
