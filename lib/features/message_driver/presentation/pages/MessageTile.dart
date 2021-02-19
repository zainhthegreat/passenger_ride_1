import 'package:flutter/material.dart';

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
import 'package:passenger/features/message_driver/presentation/pages/MessageTile.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/signup/presentation/pages/signUpScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MessageTile extends StatelessWidget {
  MessageTile(this.isSender,this.dt,this.txt);
 final  DateTime dt  ;

final  bool isSender ;
final  String txt ;

  @override
  Widget build(BuildContext context) {

    return isSender? Container(
      padding: EdgeInsets.all(10),


      // color: Colors.red,
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        crossAxisAlignment:CrossAxisAlignment.end ,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(DateFormat('h:mm a').format(dt),style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 10,fontWeight: FontWeight.normal),),
          ),
Container(width: 1,),
Flexible(
  child:   Material(
    color: Mycolor.electricBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight:Radius.circular(18),topLeft: Radius.circular(18),bottomLeft: Radius.circular(18) ),
      // side: BorderSide(color: Colors.red)
    ),

    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
txt,style: GoogleFonts.poppins(color: Mycolor.backgroundColor.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.w600),        textAlign: TextAlign.right,),
    ),

  ),
)
        ],
      ),
    ):Container(
      padding: EdgeInsets.all(10),


      // color: Colors.red,
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        crossAxisAlignment:CrossAxisAlignment.end ,
        children: [
          Expanded(
            child: Material(
              color: Mycolor.h1color.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight:Radius.circular(18),topLeft: Radius.circular(18),bottomRight:  Radius.circular(18) ),
                // side: BorderSide(color: Colors.red)
              ),

              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(txt,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.w300),),
              ),

            ),
          ),
          Text(DateFormat('h:mm a').format(dt),style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 10,fontWeight: FontWeight.normal),),

        ],
      ),
    );
  }
}
