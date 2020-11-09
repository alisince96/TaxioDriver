import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:taxio/Blocs/RegistrationBloc/bloc/registeration_bloc.dart';
import 'package:taxio/Screens/OPTscreen.dart';
import 'package:taxio/Screens/RegisterNameEmailPW.dart';
import '../Constants/Constants.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterPhoneScreen extends StatefulWidget {
  static const routeName = '/RegisterPhoneScreen';

  @override
  _RegisterPhoneScreenState createState() => _RegisterPhoneScreenState();
}

class _RegisterPhoneScreenState extends State<RegisterPhoneScreen> {
  RegisterationBloc _registerationBloc;
  bool showLoader = false;
  initState() {
    super.initState();
    _registerationBloc = BlocProvider.of<RegisterationBloc>(context);
  }

  TextEditingController phoneController = TextEditingController();
  String phoneNumber;

  _onCountryChange(CountryCode countryCode) {
    return countryCode.toString();
  }

  String code = '+92';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterationBloc, RegisterationState>(
      cubit: _registerationBloc,
      listener: (context, state) {
        if (state is LoadingState) {
          showLoader = true;
        } else if (state is ErrorState) {
          showLoader = false;
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is PhoneValiditySuccess) {
          showLoader = false;
          print('Phone Verified');
          Navigator.pushNamed(context, RegisterNameEmailPW.routeName,
              arguments: phoneNumber);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: showLoader,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: deviceSize.height * 0.35,
                    child: background(),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.04,
                  ),
                  Container(
                    height: 50,
                    width: deviceSize.width * 0.7,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.black)),
                      child: Center(
                        child: CountryCodePicker(
                          onChanged: (e) => {
                            setState(() {
                              code = _onCountryChange(e);
                            })
                          },
                          initialSelection: 'Pakistan',
                          favorite: ['+39', 'Pakistan'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.04,
                  ),
                  Container(
                    height: 50,
                    width: deviceSize.width * 0.7,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.black)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: 100,
                        child: Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '$code',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: TextField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Number',
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: deviceSize.height * 0.3,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            phoneNumber = code + phoneController.text;
                            _registerationBloc.add(
                                CheckPhoneValidity(phoneNumber: phoneNumber));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: deviceSize.width * .07,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}