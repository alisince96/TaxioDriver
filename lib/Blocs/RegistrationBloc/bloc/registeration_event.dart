part of 'registeration_bloc.dart';

@immutable
abstract class RegisterationEvent {}

class CheckPhoneValidity extends RegisterationEvent {
  final String phoneNumber;
  CheckPhoneValidity({this.phoneNumber});
}

class RegisterTrigger extends RegisterationEvent {
  final String name;
  final String email;
  final String password;
  final String phone;
  RegisterTrigger({this.name, this.email, this.password, this.phone});
}
