import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxio/LogInBloc/logInEvent.dart';
import 'package:taxio/LogInBloc/logInstate.dart';
import 'package:taxio/Repository/repository.dart';
import 'package:taxio/UserDetails/UserDetails.dart';

class LogInBloc extends Bloc<LogInEvent, SignInState> {
  LogInBloc() : super(SignInInitial());

  Repository repository = Repository();

  @override
  Stream<SignInState> mapEventToState(
    LogInEvent event,
  ) async* {
    if (event is SignInEvent) {
      print('yeßssssssss');
      yield SignInLoadingState();
      Map<String, String> logIN =
          await repository.signIn(event.email, event.password);
      if (logIN['token'] == null) {
        yield SignInErrorState(error: 'You have entered Wrong Credentials');
        print(logIN);
        print('failed');
      } else {
        UserDetails.userId = logIN['userId'];
        UserDetails.token = logIN['token'];
        print(UserDetails.userId);
        print(UserDetails.token);

        yield SignInSuccess();
        print(logIN);
        print('success');
      }
    }
  }
}
