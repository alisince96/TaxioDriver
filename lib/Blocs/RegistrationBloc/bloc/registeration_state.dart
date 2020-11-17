part of 'registeration_bloc.dart';

@immutable
abstract class RegisterationState {}

class RegisterationInitial extends RegisterationState {}

class LoadingState extends RegisterationState {}

class ErrorState extends RegisterationState {
  final String error;
  ErrorState({this.error});
}

class PhoneValiditySuccess extends RegisterationState {}

class RegisterSuccess extends RegisterationState {}
