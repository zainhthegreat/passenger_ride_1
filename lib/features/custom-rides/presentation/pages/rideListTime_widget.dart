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

class RideTile_widget extends StatefulWidget {
DateTime dateTime;
String meanOfPost;
String name;
String price;
RideTile_widget(this.dateTime,this.name,this.meanOfPost,this.price);
  @override
  _RideTile_widgetState createState() => _RideTile_widgetState();
}

class _RideTile_widgetState extends State<RideTile_widget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width:  MediaQuery.of(context).size.width,
      height: 60,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: [
                  Column(
                    children: [
                        _upperText(DateFormat('h:mm').format(widget.dateTime)),
                      Material(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.black12,)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: _lowerText(DateFormat('a').format(widget.dateTime)),
                        ),
                        color: Colors.black12,
                      )
                    ],
                  ),
                  Container(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _upperText(widget.name),
                      _lowerText(widget.meanOfPost),
                    ],
                  )

                ],
              ),
              Column(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  _upperText(r'$12'),
                  Container(height: 1,)
                ],
              )
            ],
          ),
          Container(height: 5,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
             Container(),
              Container(      width:  MediaQuery.of(context).size.width * 0.8,height: 1,color: Colors.black12,),
            ],
          )
        ],
      ),
    );
  }

  _upperText(str){
  return   Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.w400),);


  }
  _lowerText(str){
    return   Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.normal),);


  }
  _upperTextWid() {
    return Expanded(child: Container(child: Text(helloScreenUpper, style: Theme.of(context).textTheme.headline1)));
  }

  _getCrousel() {    return Expanded(child: Container(child: Text(helloScreenUpper, style: Theme.of(context).textTheme.headline1)));
  }

  _bottomWid() {    return Expanded(child: Container(child: Text(helloScreenUpper, style: Theme.of(context).textTheme.headline1)));
  }

  _getcountryDropDown(fun){
    return CountryCodePicker(
      onChanged: fun,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'PK',
      favorite: ['+92','PK'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: false,

    );

  }

  _getTextFieldColumn(label,ctrl,istrue,fun ){

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.normal),),
        _getTextField(ctrl,TextInputType.number ,istrue,fun),],

    );

  }

  _getTextField(TextEditingController ctrl,  TextInputType tctip,isvisible,codeNumberFun){

    return  Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      alignment:Alignment.center ,
      child: TextField(

          controller: ctrl,
          keyboardType: tctip,
          decoration: InputDecoration(
            prefixIcon: _getcountryDropDown(codeNumberFun),
            suffixIcon: isvisible?Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child:   Icon(Icons.check_circle_rounded,color: Mycolor.primaryColor, size: 28,),
            ):Container(
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
          )
      ),
    );

  }

  _getPasswordField(isvisible,psdctrl){
    return  Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,

      // padding: EdgeInsets.only(left: 20),
      child: TextField(

          controller: psdctrl,

          obscureText: true,

          decoration: InputDecoration(

            hintText: "Password",
            suffixIcon: isvisible?Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child:   Icon(Icons.check_circle_rounded,color: Mycolor.primaryColor, size: 28,),
            ):Container(
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
          )
      ),
    );
  }

  _getTopRow( back){
    return Row(
      children: [
        FlatButton(onPressed: back,
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        Text('data')

      ],
    );


  }

  _BigBlueButton(String str,Function fun){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlatButton(

        onPressed: fun, child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(str,style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
          Icon(Icons.arrow_forward,color: Colors.white,size: 30,)

        ],
      ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),

        padding: EdgeInsets.only(left: 10,bottom: 15,top: 15,right: 10),
        color: Mycolor.electricBlue,

      ),
    );

    _loginButton(fun){


    }

  }

  _buttonText (str,fun){
    return       FlatButton(
      padding:  EdgeInsets.all(0),
      onPressed: fun,
      color: Colors.transparent,
      child: Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal),
      ),
    );

  }

  _otherSignInOption(){
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Or Sign In Using',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal),),
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
                  width: MediaQuery.of(context).size.width* 0.05,
                ),
                CircleAvatar(
                  radius: 22.0,
                  backgroundImage:
                  AssetImage  ('assets/ui/signinoption/google.png'),
                  backgroundColor: Colors.transparent,
                )


              ],
            )

          ],),
      ),
    );
  }
}

