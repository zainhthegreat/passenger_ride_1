import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/signupTerms/presentation/pages/signUpTermsScreen.dart';
import 'package:passenger/features/custom-rides/presentation/pages/custom-ridesScreen.dart';

import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class Pasenger_Profile extends StatefulWidget {

  String name = "Ali Ahmed";
  String rating = '4.5';

  @override
  _PassengerProfileState createState() => _PassengerProfileState();
}


// counter tutorial link
//https://stackoverflow.com/questions/54610121/flutter-countdown-timer
class _PassengerProfileState extends State<Pasenger_Profile> {
  TextEditingController otpctrl = TextEditingController();
  bool isCorrectNumber = false;
  bool isPassVisible = false;
  final _formKey = GlobalKey<FormState>();
  //image choohoosing


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
            Common_Widgets_Class.TopbarwithChooseProfileImage(context, () {
              Navigator.pop(context);
            }, 'My Account',(){
              getImage();

            },_image ,90.0),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  Text('Passenger',style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.3),fontSize: 16,fontWeight: FontWeight.bold),),
           Container(height: 5,),
                  Text(widget.name,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 20,fontWeight: FontWeight.bold),),
                  Container(height: 5,),

                  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Icon(Icons.star,color: Colors.amber,size: 24,),
    Text(widget.rating,style: GoogleFonts.poppins(color: Colors.amber,fontSize: 16,fontWeight: FontWeight.bold),),

  ],)
                ],
              ),
            ),

            Form(
              key: _formKey,

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // TextFormField(
                    //   decoration: new InputDecoration(
                    //     hintText: "First name",
                    //   ),
                    //   validator: (value) {
                    //     if (value.isEmpty) {
                    //       return 'Please enter some text';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // TextFormField(
                    //   decoration: new InputDecoration(
                    //     hintText: "Last name",
                    //   ),
                    //   validator: (value) {
                    //     if (value.isEmpty) {
                    //       return 'Please enter some text';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    TextFormField(

                      decoration: new InputDecoration(
                      labelText: 'Phone',
                        hintText: "+92 310 xxx xx xx",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: 'Email',
                        hintText: "shujaamarwat@gmail.com",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: 'Language',
                        hintText: "Urdu, English",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Address",
                        hintText: 'Sector F-8/2, Islamabad'
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    _BigBlueButton('Log Out',(){
                      // Validate returns true if the form is valid, or false
                      // otherwise.
Navigator.push(context, MaterialPageRoute(builder: (context) => Custom_Rides(),));
                      // if (_formKey.currentState.validate()) {
                      //   // If the form is valid, display a Snackbar.
                      //   Scaffold.of(context)
                      //       .showSnackBar(SnackBar(content: Text('Processing Data')));
                      //
                      // }

                    }),
                  ],
                ),
              ),
            ),
          ],
        )/* ListView(
          children: [
            Common_Widgets_Class.Topbar(context, () {}, 'WELCOME'),
        new Column(
          children: <Widget>[
            new ListTile(
              // leading: const Icon(Icons.person),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "First name",
                ),
              ),
            ),
            new ListTile(
              // leading: const Icon(Icons.phone),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Last name",
                ),
              ),
            ),
            new ListTile(
              // leading: const Icon(Icons.email),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),

            new ListTile(
              // leading: const Icon(Icons.label),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Home address",
                ),
              ),
            ),
            new ListTile(
              // leading: const Icon(Icons.label),
              title: new TextField(
                obscureText:isPassVisible ,
                decoration: new InputDecoration(
                  hintText: "Password",
                  suffixIcon:_getPassLeading()
                ),
              ),
            ),
            _BigBlueButton('Create Account',(){
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => Pasenger_Profile( ),
              //     ));

            }),
          ],
        ),
          ],
        )*/,
      ),
    ));
  }

_getPassLeading(){

  return isPassVisible?  IconButton(onPressed: (){setState(() {
    isPassVisible = !isPassVisible;
  });},icon:Icon(Icons.remove_red_eye_outlined,color: Mycolor.electricBlue ) ,):IconButton(onPressed: (){setState(() {
    isPassVisible = !isPassVisible;
  });},icon:Icon(Icons.remove_red_eye,color: Mycolor.electricBlue ) ,);

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
  _BigBlueButton(String str,Function fun){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlatButton(

        onPressed: fun, child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(str,style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),

        ],
      ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),

        padding: EdgeInsets.only(left: 10,bottom: 0,top: 0,right: 10),
        color: Mycolor.electricBlue,

      ),



    );

    _loginButton(fun){


    }

  }
}
