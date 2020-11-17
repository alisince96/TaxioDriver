import 'package:taxio/Models/RegisterResponse.dart';
import 'package:taxio/Models/phoneValidityResponse.dart';
import 'package:taxio/Providers/MapListingProvider.dart';
import 'package:taxio/Providers/SignInProvider.dart';
import 'package:taxio/Providers/phoneValidityProvider.dart';
import 'package:taxio/Providers/registerProvider.dart';

class Repository {
  Future<PhoneValiditityResponse> checkPhoneValiditity(
          String phoneNumber) async =>
      PhoneValidityProvider().checkPhoneValiditity(phoneNumber);

  Future<String> checkRegisterCredentials(
          String name, String email, String password, String phone) async =>
      RegisterProvider().checkRegisterCredentials(name, email, password, phone);

  Future<RegisterResponse> register(
          {String name, String email, String phone, String password}) async =>
      RegisterProvider().register(name, email, phone, password);

  Future<Map<String, String>> signIn(String email, String password) async {
    Map<String, String> token = await SignInProvider().signIn(email, password);
    return token;
  }

  Future<void> map() async {
    await MapListingProvider().mapList();
    // return token;
  }
}
