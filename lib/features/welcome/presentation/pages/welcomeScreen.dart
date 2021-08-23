import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/features/signup/presentation/pages/signUpScreen.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
import 'package:passenger/features/sigin/presentation/pages/siginInScreen.dart';

class SiginUpScreen extends StatefulWidget {
  @override
  _SiginUpState createState() => _SiginUpState();
}

class _SiginUpState extends State<SiginUpScreen> {
//crousal index
  int currindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Mycolor.backgroundColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
              ),
              Common_Widgets_Class.getMasterHeadingWithUpperSubHeading(
                  'Get a new experience', 'Hello, nice to meet you!'),

              // _getTextFieldColumn('',phnctrl,isCorrectNumber, (CountryCode countrycode){
              //   Country_code = countrycode;
              //   print(Country_code.dialCode + phnctrl.text);
              // }),

              _crousalView(),

              _BigBlueButton('Login with Phone ', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sigin(),
                    ));
              }),

              _buttonText('Or Create My Account', '', '', '', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SiginUp(),
                    ));
              }),

              //  _upperTextWid(), _getCrousel(), _bottomWid(),
            ],
          ),
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
              CircleAvatar(
                radius: 17.0,
                backgroundImage:
                    AssetImage('assets/ui/signinoption/facebook.png'),
                backgroundColor: Colors.transparent,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              CircleAvatar(
                radius: 22.0,
                backgroundImage:
                    AssetImage('assets/ui/signinoption/google.png'),
                backgroundColor: Colors.transparent,
              )
            ],
          )
        ],
      ),
    );
  }

  _crousalView() {
    List<int> list = [1, 2, 3, 4];

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              initialPage: currindex,
              autoPlay: true,
              enableInfiniteScroll: true,
              aspectRatio: 1.2,
              pageSnapping: true,
              disableCenter: false,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                setState(() {
                  print('333');
                  currindex = index;
                });
              }),
          items: list
              .map((item) => Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,

                    child: Image.asset(
                      'assets/ui/welcome_screen_crousal/' +
                          item.toString() +
                          '.png',
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.green,
                  ))
              .toList(),
        ),
        Container(
          // padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/3 ),
          height: 80,

          alignment: Alignment.center,
          width: list.length * 15.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return currindex != index
                  ? Icon(
                      Icons.circle,
                      color: Colors.black12,
                      size: 15,
                    )
                  : Icon(Icons.circle, color: Mycolor.electricBlue, size: 15);
            },
          ),
        )
      ],
    );
  }
}
