import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taxio/Models/RegisterResponse.dart';
import 'package:taxio/Models/phoneValidityResponse.dart';
import 'package:taxio/Repository/repository.dart';

part 'registeration_event.dart';
part 'registeration_state.dart';

class RegisterationBloc extends Bloc<RegisterationEvent, RegisterationState> {
  static String err = null;

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
          yield ErrorState(error: '$err');
        }
      }
    } else if (event is RegisterTrigger) {
      yield LoadingState();

      RegisterResponse registerResponse = await repository.register(
          name: event.name,
          email: event.email,
          password: event.password,
          phone: event.phone);

      if (registerResponse != null && registerResponse.data != null) {
        yield RegisterSuccess();
      } else {
        yield ErrorState(error: '$err');
      }
    }
  }
}
