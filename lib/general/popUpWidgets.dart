
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/variables.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
import 'package:passenger/features/sigin-otp/presentation/pages/siginInOtpScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class PopUpWidgets{
  static Widget CanelRide(context, fun){
    return Material(
      elevation: 20,
      color: Mycolor.backgroundColor,
      child: Container(height: 130,width: MediaQuery.of(context).size.width,
      child: Column(
        // mainAxisAlignment:MainAxisAlignment.center ,
crossAxisAlignment:CrossAxisAlignment.center ,
        children: [
          Container(
            width: MediaQuery.of(context).size.width* 0.8,
            alignment: Alignment.center,

            child: Text(
              'Are you sure you want to cancel your ride?',
              textAlign:TextAlign.center ,
              style: GoogleFonts.poppins(
                  color: Mycolor.h1color.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.bold,),

            ),
          ),
          Container(height: 1,width: MediaQuery.of(context).size.width * 0.8,color: Mycolor.h1color.withOpacity(0.2),),

          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            children: [
            // _button(context,(){}),
            _button('Yes',(){}),
            Container(width: 1,height: 30,color: Mycolor.h1color.withOpacity(0.2),),
            _button('No',(){}),

          ],)
        ],
      ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      // side: BorderSide(color: Colors.red)
    );



  }
  static Widget ArrivingCancel(context, fun){
    return Material(
      elevation: 20,
      color: Mycolor.backgroundColor,
      child: Container(height: 160,width:
      MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
            Container(
              width: MediaQuery.of(context).size.width* 0.8,
              alignment: Alignment.center,

              child: Text(
                'Are you sure you want to cancel your ride?',
                textAlign:TextAlign.center ,
                style: GoogleFonts.poppins(
                  color: Mycolor.h1color.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.bold,),

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width* 0.8,
              alignment: Alignment.center,

              child: Text(
                "You'll be partially charged for it",
                textAlign:TextAlign.center ,
                style: GoogleFonts.poppins(
                  color: Mycolor.h1color, fontSize: 16, fontWeight: FontWeight.bold,),

              ),
            ),
            Container(height: 1,width: MediaQuery.of(context).size.width * 0.8,color: Mycolor.h1color.withOpacity(0.2),),

            Container(
              height: 30,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  // _button(context,(){}),
                  _button('Yes',(){}),
                  Container(width: 1,height: 30,color: Mycolor.h1color.withOpacity(0.2),),
                  _button('No',(){}),

                ],),
            )
          ],
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      // side: BorderSide(color: Colors.red)
    );



  }
  static Widget SignOutAlret(context, fun){
    return Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      crossAxisAlignment:CrossAxisAlignment.center ,
      children: [

        Container(

          width: MediaQuery.of(context).size.width* 0.8,
          alignment: Alignment.center,

          child: Text(
            "Are you sure you want to sign out?",
            textAlign:TextAlign.center ,
            style: GoogleFonts.poppins(
              color: Mycolor.h1color, fontSize: 18, fontWeight: FontWeight.normal,),

          ),
        ),
        Container(height: 1,width: MediaQuery.of(context).size.width * 0.8,color: Mycolor.h1color.withOpacity(0.2),),

        Container(
          height: 30,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              // _button(context,(){}),
              _button('Yes',(){}),
              Container(width: 1,height: 30,color: Mycolor.h1color.withOpacity(0.2),),
              _button('No',(){}),

            ],),
        )
      ],
    );



  }
}

_BigBlueButton(String str, Function fun) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: FlatButton(
      onPressed: fun,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            str,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)),
      padding: EdgeInsets.only(right: 15, left: 15),
      color: Mycolor.electricBlue,
    ),
  );

  _loginButton(fun) {}
}
_button(String str, Function fun) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: FlatButton(
      onPressed: fun,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            str,
            style: GoogleFonts.poppins(
                color: Mycolor.h1color, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)),
      padding: EdgeInsets.only(right: 15, left: 15),
      color: Mycolor.backgroundColor,
    ),
  );

  _loginButton(fun) {}
}