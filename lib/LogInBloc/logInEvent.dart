abstract class LogInEvent {}

class SignInEvent extends LogInEvent {
  String email;
  String password;
  SignInEvent(this.email, this.password);
}
