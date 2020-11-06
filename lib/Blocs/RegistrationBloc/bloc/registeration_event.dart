part of 'registeration_bloc.dart';

@immutable
abstract class RegisterationEvent {}

class CheckPhoneValidity extends RegisterationEvent {
  final String phoneNumber;
  CheckPhoneValidity({this.phoneNumber});
}
