import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/core/enums/signinMethod.dart';
import 'package:passenger/core/modals/CreateUserRequestModal.dart';
import 'package:passenger/core/modals/UserModal.dart';
import 'package:passenger/core/services/Auth/AuthRoutine.dart';
import 'package:passenger/features/Drawer/presentation/pages/drawer_core.dart';
import 'package:passenger/features/Select_Destination/presentation/pages/select-destination.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:passenger/util.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/signupTerms/presentation/pages/signUpTermsScreen.dart';
import 'package:passenger/features/custom-rides/presentation/pages/custom-ridesScreen.dart';

import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:passenger/features/Drawer/presentation/pages/DrawerMaster.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Sigup_Profile extends StatefulWidget {
  final uid;
  Sigup_Profile(this.uid);
  @override
  _SiginState createState() => _SiginState();
}

// counter tutorial link
//https://stackoverflow.com/questions/54610121/flutter-countdown-timer
class _SiginState extends State<Sigup_Profile> {
  TextEditingController otpctrl = TextEditingController();
  bool isCorrectNumber = false;
  bool isPassVisible = false;
  final _formKey = GlobalKey<FormState>();
  //image choohoosing

  final TextEditingController textCtrlFname =
      TextEditingController(text: 'John');
  final TextEditingController textCtrlLname =
      TextEditingController(text: 'Spike');
  final TextEditingController textCtrlEmail =
      TextEditingController(text: 'JohnSpike123@gmail.com');
  final TextEditingController textCtrladdress =
      TextEditingController(text: 'street 7, house 8 ');

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            Common_Widgets_Class.TopbarwithChooseProfileImage(
                context,
                () {
                  Navigator.pop(context);
                },
                'WELCOME',
                () {
                  getImage();
                },
                _image,
                90.0),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: textCtrlFname,
                      decoration: new InputDecoration(
                        labelText: 'First Name',
                        hintText: "First name",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: textCtrlLname,
                      decoration: new InputDecoration(
                        hintText: "Last name",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: textCtrlEmail,
                      decoration: new InputDecoration(
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: textCtrladdress,
                      decoration: new InputDecoration(
                        hintText: "Home address",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    _BigBlueButton('Create Account', () async {


//Creating a CreateUserRequestModal to upload to firebase as well as await
                      CreateUserRequestModal userModal =
                      CreateUserRequestModal(
                        fcmToken: await FirebaseMessaging.instance.getToken(),
                        loginMethod: LoginMethod.GOOGLE,
                        user: UserModal(
                          photoUri: '',
                          passengerId: widget.uid.toString(),
                          email: textCtrlEmail.text,
                          firstName: textCtrlFname.text,
                          homeAddress: textCtrladdress.text,
                          lastName: textCtrlLname.text,
                        ),
                      );

                      //TODO uncommenting
//POSTING USER PROFILE TO the DATABASE

                      final response = await http.post(
                        Uri.parse('$baseURL/login/register_passenger'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(userModal.toJson()),
                      );

                      if (response.statusCode == 201 || response.statusCode == 200) {

                        //Entering data to firebase also
                       Map<String, dynamic> data = jsonDecode(convert.jsonEncode(userModal.toJson()));
                        var returnData = await FirebaseFirestore.instance.collection('user').doc(userModal.user.passengerId).set(data) ;




                       print("POST register_passenger Done!\n");
                      } else {
                        // If the server did not return a 201 CREATED response,
                        // then throw an exception.

                        //TODO uncomment LINE
                       throw Exception(response.statusCode);
                      }

                      User user= FirebaseAuth.instance.currentUser;
                      print("USER: ");
                      print("USER: ");
                      print("USER: "+userModal.user.passengerId.toString());
                      print("USER: ");
                      print("USER: ");
                      print("USER: ");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Drawer_MainScreen(user: userModal.user )));
                      
                      

                    }),
                  ],
                ),
              ),
            ),
          ],
        )
        ,
      ),
    ));
  }

  _getPassLeading() {
    return isPassVisible
        ? IconButton(
            onPressed: () {
              setState(() {
                isPassVisible = !isPassVisible;
              });
            },
            icon: Icon(Icons.remove_red_eye_outlined,
                color: Mycolor.electricBlue),
          )
        : IconButton(
            onPressed: () {
              setState(() {
                isPassVisible = !isPassVisible;
              });
            },
            icon: Icon(Icons.remove_red_eye, color: Mycolor.electricBlue),
          );
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

  _CircleIconButton(String str, String timer, Function fun) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: str,
                  style: GoogleFonts.poppins(
                      color: Mycolor.h1color,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
              TextSpan(
                  text: timer,
                  style: GoogleFonts.poppins(
                      color: Mycolor.electricBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RaisedButton(
          padding: const EdgeInsets.all(10),
          elevation: 5,
          onPressed: fun,
          child: new Icon(
            Icons.arrow_forward,
            color: Mycolor.h1color,
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
}
