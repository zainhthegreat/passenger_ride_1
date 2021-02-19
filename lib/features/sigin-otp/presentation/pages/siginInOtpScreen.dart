import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/signupTerms/presentation/pages/signUpTermsScreen.dart';

import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';

class Sigin_otp extends StatefulWidget {
  String phoneNumber = '';
  Sigin_otp(this.phoneNumber);
  @override
  _SiginState createState() => _SiginState();
}


// counter tutorial link
//https://stackoverflow.com/questions/54610121/flutter-countdown-timer
class _SiginState extends State<Sigin_otp> {
  TextEditingController otpctrl = TextEditingController();

  //textFeild
  bool isCorrectNumber = false;

  //counter timer varaibles
  Timer _timer;
  int _start = 10;
  String currentText;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpctrl.addListener(() {
      setState(() {
        isCorrectNumber = (otpctrl
            .text.length >
            9)
            ? true
            : false;
      });
    });

    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
startTimer();
    });

  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Mycolor.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Common_Widgets_Class.Topbar(context, () {
              Navigator.pop(context);
            }, 'BACK'),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Common_Widgets_Class.getMasterHeadingWithUpperSubHeadingLowerSubHeadingWithBlue('Enter your OTP code','Phone Verification','Enter the 4-digit code sent to you at ${widget.phoneNumber}',' did you enter the correct number?'),
                  // _getPasswordField(false, otpctrl),
                  Container(height: 15,),
                PinCodeTextField(

                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Mycolor.backgroundColor,
                    fontWeight: FontWeight.bold,
                  ),

                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v.length < 3) {
                      return "Please Enter OTP";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(

                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor:
                   /* hasError ? Colors.orange : */Colors.white,
                    activeColor: Colors.white,
                    disabledColor: Colors.white,

                    inactiveColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: TextStyle(fontSize: 20, height: 1.6),
                  backgroundColor: Mycolor.backgroundColor,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: otpctrl,
                  keyboardType: TextInputType.number,
                  // boxShadows: [
                  //   BoxShadow(
                  //     offset: Offset(0, 1),
                  //     color: Colors.black12,
                  //     blurRadius: 10,
                  //   )
                  // ],
                  onCompleted: (v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),


                  _buttonText('Forgot password?', () {}),

                  _CircleIconButton('Resend Code in ',_start.toString()+' seconds', () {
Navigator.push(context, MaterialPageRoute(builder: (context) => SiginUpTerms(),));
                    // Sigin_In
                  }),

                  //  _upperTextWid(), _getCrousel(), _bottomWid(),
                ],
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

          )),
    );
  }

  _CircleIconButton(String str,String timer, Function fun) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(

            children: <TextSpan>[
              TextSpan(text:str, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal)),
              TextSpan(text: timer, style:GoogleFonts.poppins(color: Mycolor.electricBlue,fontSize: 14,fontWeight: FontWeight.bold)),

            ],
          ),
        ) ,
        RaisedButton(
          padding: const EdgeInsets.all(10),


          elevation: 5,
          onPressed:fun,
          child: new Icon(
            Icons.arrow_forward,
            color:Mycolor.h1color,
            size: 20.0,
          ),
          shape: new CircleBorder(),
          color: Mycolor.backgroundColor,
        ),
      ],
    );

  }

  _buttonText(str, fun) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: fun,
      color: Colors.transparent,
      child: Text(
        str,
        style: GoogleFonts.poppins(
            color: Mycolor.h1color,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      ),
    );
  }


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
