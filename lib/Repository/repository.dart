import 'package:taxio/Models/RegisterResponse.dart';
import 'package:taxio/Models/phoneValidityResponse.dart';
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
}
