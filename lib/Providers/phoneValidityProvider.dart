import 'dart:collection';

import 'package:taxio/Blocs/RegistrationBloc/bloc/registeration_bloc.dart';
import 'package:taxio/Models/phoneValidityResponse.dart';
import 'package:taxio/Providers/base_provider.dart';
import 'package:taxio/Web_services/GetDataFromHttp.dart';
import 'package:taxio/Web_services/service_urls.dart';

class PhoneValidityProvider extends BaseProvider {
  Future<PhoneValiditityResponse> checkPhoneValiditity(
      String phoneNumber) async {
    Map phoneParam = HashMap<String, dynamic>();
    phoneParam.putIfAbsent('phone', () => phoneNumber.toString());
    try {
      dynamic response = await GetDataFromHttp.apiHit(
          ServiceUrls.phoneValditityAPI, phoneParam);

      print(response);
      if (response['message'] != null) {
        RegisterationBloc.err = response['message'];
      }

      PhoneValiditityResponse phoneValiditityResponse =
          PhoneValiditityResponse.fromJson(response);

      if (phoneValiditityResponse.data != null) {
        return phoneValiditityResponse;
      } else {
        print('Phone validity API response failed');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
