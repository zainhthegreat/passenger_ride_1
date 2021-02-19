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
import 'package:passenger/features/select-car-3/presentation/pages/select_car_3.dart';
import 'package:passenger/features/Select_your_car/presentation/pages/select-your-car.dart';
class Select_Destination extends StatefulWidget {
  @override
  _SelectDestinatoinState createState() => _SelectDestinatoinState();
}

class _SelectDestinatoinState extends State<Select_Destination> {



  TextEditingController phnctrl =   TextEditingController();
  bool isCorrectNumber = false;
  CountryCode Country_code =CountryCode();


  @override
  void initState() => phnctrl.addListener(() {

      setState(() {
        isCorrectNumber = /*(phnctrl.text.isNumeric() ) &&  */(phnctrl.text.length==9 )?true:false;
             });
    });



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor:Mycolor.backgroundColor,

      body: Container(

        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Common_Widgets_Class.TopbarWhiteBase(context,(){
              Navigator.pop(context);
            },'Choose Destination',''),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

Column(
  children: [
    _addShopButon((){}),
    Container(height: 10,),

    _getFromToTripTile('Centaurus Mall','FAST NUCES Islamabad'),
    Container(height: 10,),
    _IconTextTile(Icons.home_outlined ,'University'),
      _IconTextTile(Icons.access_time ,'Upton St. 99'),
      _IconTextTile(Icons.access_time ,'Sparkvill Ave 111'),
    _IconTextTile(Icons.access_time ,'James Cameron Plasa'),

Container(height: 5,),
    Container(
     padding: EdgeInsets.only(top: 10,bottom: 5),
      height: 1,width: MediaQuery.of(context).size.width,color: Mycolor.h1color.withOpacity(0.4),),
    Container(height: 5,),
    _IconTextTile(Icons.add,'Save Location'),

    FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Select_car_3(),));

      },
      child:     _IconTextTile(Icons.pin_drop_outlined ,'PIN Location'),
    ),








  ],
),


                    _CurvedBigBlueButton('Accept',(){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => Select_your_car(),));

                    }),


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

  _InvoiceTile(left, right){

    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children: [
        Text(left,
          style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),
              fontSize: 14,fontWeight: FontWeight.normal),),
        Text(right,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.bold),)

      ],
    );
  }
  _TPD_Widget(){

return Row(
  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
  children: [
    _TPDSquare('Time:','31 min'),
    _TPDSquare('Price:','200 PKR'),
    _TPDSquare('Distance:','4,8 km'),
  ],
);
  }
  _TPDSquare(up,lower){
    return Column(
      children: [
      Text(up,
      style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.4),
          fontSize: 14,fontWeight: FontWeight.normal),),
    Text(lower,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.bold),)

    ],
    );
  }

  _addShopButon(fun
  ){

    return Row(
      mainAxisAlignment:MainAxisAlignment.end ,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 100,
          height: 25,
          child: FlatButton(


            onPressed: fun, child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add,color: Colors.white,size: 17,),
              Container(width: 5,),
              Text('Add Stop',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
              // Icon(Icons.arrow_forward,color: Colors.white,size: 30,)

            ],
          ),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),

            padding: EdgeInsets.only(left: 5,bottom: 0,top: 0,right: 5),
            color: Mycolor.electricBlue,

          ),
        ),
      ],
    );

  }

  _IconTextTile( icon, String txt){
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 10),
            child: Icon(icon,color: Mycolor.electricBlue,size: 30,),
          ),
          Text(txt,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 14,fontWeight: FontWeight.normal),)
        ],
      ),
    );

  }
_getFromToTripTile(String from, String to){
return Material(
  elevation: 20,
  color: Mycolor.backgroundColor,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
  ),

  child:   Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Row(



      children: [


Padding(
    padding: const EdgeInsets.only(left: 20),
    child:   Column(

      crossAxisAlignment:CrossAxisAlignment.start ,

      children: [



        _upperTextWid('To'),

        _lowerText("FAST NUCES Islamabad")

      ],

    ),
),

      ],

    ),
  ),
);

}

_getDriverDetail(picUrl,name,carnumber, carcolor, carname , rating){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width ,
      child: Column(
        children: [
          Container(color: Mycolor.h1color.withOpacity(0.2),
          height: 1,
            // width: MediaQuery.of(context).size.width ,
          ),

Container(
  padding: EdgeInsets.only(top: 10),
    alignment: Alignment.centerLeft,
    child: Text('Your Driver',style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.normal),)),


          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 17.0,
                      backgroundImage:
                      NetworkImage(picUrl),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start ,
                        children: [
                          Text(name,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 15,fontWeight: FontWeight.bold),),
                          Text(carcolor+' '+carname,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.normal),),
                          Text(carnumber,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start ,

                  children: [
                    Text('You rated',style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.normal),),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:_ratingStar(rating),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
}

  _ratingStar(String rating){

    return RatingBar.builder(
      onRatingUpdate: (d){},
      initialRating: double.parse(rating),
      minRating: 0,
      direction:   Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.black.withAlpha(50),
      itemCount: 5,
      itemSize: 15.0,
      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.black,
      ),

      updateOnDrag: true,
    );

  }

  _upperTextWid(helloScreenUpper) {
    return Container(
        child:Text(helloScreenUpper,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.normal),)

    );
  }
  _lowerText(str){
    return   Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.bold),);


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
  _CurvedBigBlueButton(String str,Function fun){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlatButton(

        onPressed: fun, child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(str,style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
            // Icon(Icons.arrow_forward,color: Colors.white,size: 30,)

          ],
        ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),

        padding: EdgeInsets.only(left: 10,bottom: 5,top: 5,right: 10),
      color: Mycolor.electricBlue,

      ),
    );

    _loginButton(fun){


    }

  }
  _buttonText (str1,str2,str3 ,str4,fun){
    return       Column(
      children: [
        Container(color: Mycolor.h1color.withOpacity(0.2),
          height: 1,
          // width: MediaQuery.of(context).size.width ,
        ),
        FlatButton(
          padding:  EdgeInsets.all(0),
           onPressed: fun,
          color: Colors.transparent,
          child:RichText(
            text: TextSpan(

              children: <TextSpan>[
                TextSpan(text: str1, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal)),
                TextSpan(text: str2, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.bold)),
                TextSpan(text: str3, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal)),
                TextSpan(text: str4, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.bold)),

              ],
            ),
          ) ,
        ),
      ],
    );

  }
  _otherSignInOption(){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text('Or Sign Up Using',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal),),
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
    );
  }


}
