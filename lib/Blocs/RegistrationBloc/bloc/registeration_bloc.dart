import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxio/Models/phoneValidityResponse.dart';
import 'package:taxio/Repository/repository.dart';

part 'registeration_event.dart';
part 'registeration_state.dart';

class RegisterationBloc extends Bloc<RegisterationEvent, RegisterationState> {
  RegisterationBloc() : super(RegisterationInitial());
  Repository repository = Repository();

  @override
  Stream<RegisterationState> mapEventToState(
    RegisterationEvent event,
  ) async* {
    if (event is CheckPhoneValidity) {
      yield LoadingState();
      PhoneValiditityResponse phoneValiditityResponse =
          await repository.checkPhoneValiditity(event.phoneNumber);
      if (phoneValiditityResponse != null) {
        if (phoneValiditityResponse.status == 'success' &&
            phoneValiditityResponse.data.isAvailable == true) {
          yield PhoneValiditySuccess();
        } else {
          yield ErrorState(error: 'Invalid phone number');
        }
      }
    }
  }
}
