import 'dart:collection';

import 'package:taxio/Blocs/RegistrationBloc/bloc/registeration_bloc.dart';
import 'package:taxio/Models/RegisterResponse.dart';
import 'package:taxio/Providers/base_provider.dart';
import 'package:taxio/Web_services/GetDataFromHttp.dart';
import 'package:taxio/Web_services/service_urls.dart';
import 'package:taxio/utils/AppGlobal.dart';

class RegisterProvider extends BaseProvider {
  Future<String> checkRegisterCredentials(
      String name, String email, String password, String phone) async {
    if (!AppGlobal.isValidEmail(email)) {
      return 'Please enter a valid email';
    } else if (!AppGlobal.isValidPassword(password)) {
      return 'Please enter a valid password';
    } else if (!AppGlobal.isValidString(name)) {
      return 'Please enter a valid name';
    } else if (!AppGlobal.isValidString(phone)) {
      return 'Please enter a valid phone';
    } else {
      return 'success';
    }
  }

  Future<RegisterResponse> register(
      String name, String email, String phone, String password) async {
    try {
      Map registerParams = HashMap<String, dynamic>();
      registerParams.putIfAbsent('name', () => name.toString());
      registerParams.putIfAbsent('email', () => email.toString());
      registerParams.putIfAbsent('password', () => password.toString());
      registerParams.putIfAbsent('phone_number', () => phone.toString());
      dynamic response =
          await GetDataFromHttp.apiHit(ServiceUrls.registerAPI, registerParams);

      if (response['message'] != null) {
        RegisterationBloc.err = response['message'];
      }
      RegisterResponse registerResponse = RegisterResponse.fromJson(response);
      if (response['message'] == null &&
          registerResponse != null &&
          registerResponse.status == 'success') {
        return registerResponse;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
