import 'dart:convert';
import 'package:http/http.dart' as http;

class MapListingProvider {
  Future<dynamic> mapList() async {
    print('3');
    final url = 'http://dubaitaxio.dressbeat.com/Webservices/trip_list?';

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Auth': '3a5f8324d429e6c765b7d60a31e111de',
    };
    // Map<String, String> bodyNew = {
    //   'hhh': 'application/json',
    // };
    try {
      print('start try 2');

      final response = await http.post(url, headers: headers);
      final responseData = json.decode(response.body);
      print(responseData);
    } catch (error) {
      print('q.');
      throw error;
    }
  }
}
