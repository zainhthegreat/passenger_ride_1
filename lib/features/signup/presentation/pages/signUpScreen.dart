import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/core/services/Auth/AuthRoutine.dart';
import 'package:passenger/features/Drawer/presentation/pages/DrawerMaster.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
import 'package:passenger/features/sigin-otp/presentation/pages/siginInOtpScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SiginUp extends StatefulWidget {
  @override
  _SiginUpState createState() => _SiginUpState();
}

class _SiginUpState extends State<SiginUp> {
  TextEditingController phnctrl = TextEditingController();
  bool isCorrectNumber = false;
  CountryCode Country_code = CountryCode();

  @override
  void initState() => phnctrl.addListener(() {
        setState(() {
          isCorrectNumber = /*(phnctrl.text.isNumeric() ) &&  */ (phnctrl
                      .text.length ==
                  9)
              ? true
              : false;
        });
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Mycolor.backgroundColor,
      body: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Common_Widgets_Class.Topbar(context, () {
              Navigator.pop(context);
            }, 'BACK'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Common_Widgets_Class.getMasterHeadingWithUpperSubHeading(
                        'Be a Passenger!', 'Hello, nice to meet you!'),

                    _getTextFieldColumn('', phnctrl, isCorrectNumber,
                        (CountryCode countrycode) {
                      Country_code = countrycode;
                      print(Country_code.dialCode + phnctrl.text);
                    }),

                    _buttonText('By creating an account, you agree to our\n',
                        ' Terms of Service', ' and ', 'Privacy Policy', () {}),

                    _BigBlueButton(
                      'Continue',
                      () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                              Country_code.dialCode ?? '+92' + phnctrl.text,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sigin_otp(
                                    Country_code.dialCode ??
                                        '+92' + phnctrl.text),
                              ),
                            );
                          },

                          /*
                           Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sigin_otp(
                                        Country_code.dialCode ??
                                            '+92' + phnctrl.text),
                                  ));
                           */

                          verificationFailed: (FirebaseAuthException e) {
                            Alert(
                              context: context,
                              title: e.code ?? "NULL",
                              desc: e.message ?? "NULL",
                            ).show();
                          },
                          codeSent: (String verificationId, int resendToken) {
                            print("CODE SENT");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Sigin_otp(verificationId);
                            }));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            Alert(
                              context: context,
                              title: "TIME OUT",
                              desc: verificationId,
                            ).show();
                          },
                        );
                      },
                    ),

                    _otherSignInOption()

                    //  _upperTextWid(), _getCrousel(), _bottomWid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _getcountryDropDown(fun) {
    return CountryCodePicker(
      onChanged: fun,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'PK',
      favorite: ['+92', 'PK'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: false,
    );
  }

  _getTextFieldColumn(label, ctrl, istrue, fun) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              color: Mycolor.h1color,
              fontSize: 12,
              fontWeight: FontWeight.normal),
        ),
        _getTextField(ctrl, TextInputType.number, istrue, fun),
      ],
    );
  }

  _getTextField(TextEditingController ctrl, TextInputType tctip, isvisible,
      codeNumberFun) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      alignment: Alignment.center,
      child: TextField(
          controller: ctrl,
          keyboardType: tctip,
          decoration: InputDecoration(
            prefixIcon: _getcountryDropDown(codeNumberFun),
            suffixIcon: isvisible
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Mycolor.primaryColor,
                      size: 28,
                    ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // border: UnderlineInputBorder(
            //   borderSide: BorderSide(color:  Colors.transparent),
            // ),
          )),
    );
  }

  _getPasswordField(isvisible, psdctrl) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,

      // padding: EdgeInsets.only(left: 20),
      child: TextField(
          controller: psdctrl,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: isvisible
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Mycolor.primaryColor,
                      size: 28,
                    ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),

            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // border: UnderlineInputBorder(
            //   borderSide: BorderSide(color:  Colors.transparent),
            // ),
          )),
    );
  }

  _getTopRow(back) {
    return Row(
      children: [
        FlatButton(
            onPressed: back,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        Text('data')
      ],
    );
  }

  _BigBlueButton(String str, Function fun) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlatButton(
        onPressed: fun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              str,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0)),
        padding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 10),
        color: Mycolor.electricBlue,
      ),
    );

    _loginButton(fun) {}
  }

  _buttonText(str1, str2, str3, str4, fun) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: fun,
      color: Colors.transparent,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: str1,
                style: GoogleFonts.poppins(
                    color: Mycolor.h1color,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
            TextSpan(
                text: str2,
                style: GoogleFonts.poppins(
                    color: Mycolor.h1color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: str3,
                style: GoogleFonts.poppins(
                    color: Mycolor.h1color,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
            TextSpan(
                text: str4,
                style: GoogleFonts.poppins(
                    color: Mycolor.h1color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  _otherSignInOption() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Or Sign Up Using',
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  // signInWithGoogle
                },
                child: CircleAvatar(
                  radius: 17.0,
                  backgroundImage:
                      AssetImage('assets/ui/signinoption/facebook.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  final authroutine = AuthRoutine();
                  authroutine.signInWithGoogle(context: context);
                },
                child: CircleAvatar(
                  radius: 22.0,
                  backgroundImage:
                      AssetImage('assets/ui/signinoption/google.png'),
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
