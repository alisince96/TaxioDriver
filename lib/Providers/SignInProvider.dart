import 'dart:convert';
import 'package:http/http.dart' as http;

class SignInProvider {
  String token;
  String userId;
  String status;

  Map<String, String> data = {};

  Future<Map<String, String>> signIn(String email, String password) async {
    print('yesss3');
    final url = 'http://dubaitaxio.dressbeat.com/Webservices/do_login';
    try {
      print('yesss4');
      final response = await http.post(
        url,
        body: json.encode({"username": email, "password": password}),
      );
      final responseData = json.decode(response.body);
      print(responseData);
      // print(responseData['message']);
      if (responseData['message'] != null) {
        data['token'] == null;
        print(data);
        return data;
      }

      data['token'] = responseData['data']['auth_token'];
      data['userId'] = responseData['data']['user_id'];
      data['status'] = responseData['data']['status'];
      print(data);

      return data;

      // _token = responseData['idToken'];
      // _expiryDate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(
      //       responseData['expiresIn'],
      //     ),
      //   ),
      // );
      // final prefs = await SharedPreferences.getInstance();
      // final userData = json.encode(
      //   {
      //     'token': _token,
      //     'userId': _userId,
      //     'expiryDate': _expiryDate.toIso8601String(),
      //   },
      // );
      // prefs.setString('userData', userData);
    } catch (error) {
      print('q.');
      throw error;
    }
  }
}
