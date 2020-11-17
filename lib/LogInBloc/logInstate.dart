abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInError extends SignInState {}

class SignInErrorState extends SignInState {
  final String error;
  SignInErrorState({this.error});
}
