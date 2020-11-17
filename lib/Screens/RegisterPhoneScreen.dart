import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:taxio/Blocs/RegistrationBloc/bloc/registeration_bloc.dart';
import 'package:taxio/Screens/RegisterNameEmailPW.dart';
import '../Constants/Constants.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterPhoneScreen extends StatefulWidget {
  static const routeName = '/RegisterPhoneScreen';

  @override
  _RegisterPhoneScreenState createState() => _RegisterPhoneScreenState();
}

class _RegisterPhoneScreenState extends State<RegisterPhoneScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String smsCode;
  String verificationCode;
  String phoneNumber;

  Future<void> _submit() async {
    setState(() {
      showLoader = true;
    });
    final PhoneVerificationCompleted verificationSuccess =
        (AuthCredential credential) {
      setState(() {
        print('reacheddjjshdishdihhhhhhhhhhhhhhhhhh00000000000000000000');
      });
    };

    final PhoneVerificationFailed phoneVerificationFailed =
        (AuthException exception) {};
    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationCode = verId;
      setState(() {
        showLoader = false;
      });
      smsCodeDialog(context).then((value) => print("Signed In"));
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      this.verificationCode = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationSuccess,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Enter Code",
              style: TextStyle(
                color: Colors.green[900],
              ),
            ),
            content: TextField(
              onChanged: (Value) {
                smsCode = Value;
              },
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      _registerationBloc
                          .add(CheckPhoneValidity(phoneNumber: phoneNumber));
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: verificationCode, smsCode: smsCode);
    FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential)
        .then((user) => _registerationBloc
            .add(CheckPhoneValidity(phoneNumber: phoneNumber)))
        .catchError((e) => print(e));
  }

  bool _validate = false;
  String hint = 'Enter Number';
  RegisterationBloc _registerationBloc;
  bool showLoader = false;
  initState() {
    super.initState();
    _registerationBloc = BlocProvider.of<RegisterationBloc>(context);
  }

  TextEditingController phoneController = TextEditingController();

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
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');
          print('ErrorState');

          setState(() {
            showLoader = false;
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text(state.error)));
          });
        } else if (state is PhoneValiditySuccess) {
          print('PhoneValiditySuccess');
          setState(() {
            showLoader = false;
          });
          Navigator.pushReplacementNamed(context, RegisterNameEmailPW.routeName,
              arguments: phoneNumber);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: showLoader,
          child: Scaffold(
            key: _scaffoldKey,
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
                          side: BorderSide(color: colour)),
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
                          side: BorderSide(color: colour)),
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
                                    hintText: hint,
                                    hintStyle: TextStyle(
                                        color: _validate
                                            ? Colors.redAccent
                                            : Colors.grey),
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
                          onTap: () async {
                            if (phoneController.text.isEmpty) {
                              setState(() {
                                hint = "This Field can't be empty";
                                _validate = true;
                              });
                              return;
                            } else {
                              phoneNumber = code + phoneController.text;
                              await _submit();
                            }
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
