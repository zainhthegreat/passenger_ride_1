import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/custom-rides/presentation/pages/rideListTime_widget.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/custom-rides/presentation/pages/rideListTime_widget.dart';
import 'package:passenger/features/your-trips/presentation/pages/tripListTile_widget.dart';
import 'package:passenger/features/your-trips/presentation/pages/nav_bar_row.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:passenger/features/your-trips/presentation/pages/types/TodayRides.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passenger/features/your-trips/presentation/bloc/tabIndex.dart';




class NavBarRow extends StatefulWidget {
  @override
  _NavBarRowState createState() => _NavBarRowState();
}

class _NavBarRowState extends State<NavBarRow> {

  RidesListToday today = RidesListToday();
  RidesListWeekly weekly = RidesListWeekly();
  RidesListBusiness business = RidesListBusiness();


  TextEditingController phnctrl =   TextEditingController();
  TextEditingController psdctrl =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Material(

      elevation: 0,
      borderRadius:     BorderRadius.all( Radius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          _topNavButtons(),
          Container(
              padding: EdgeInsets.only(right: 10,left: 10),
width:  MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView
              (shrinkWrap: true,

              children:_getList(),
            ),
          ),
        ],
      ),
    );
  }

  _getList(){

    int i = context.watch<TabIndex>().count;
if(i==0){
  return today.ls;
}
    if(i==1){
      return weekly.ls;
    }
    if(i==2){
      return business.ls;
    }
  }
  _columnValueDetail(String value, String detail){
    return        Column(
      children: [

        Text(value,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 11,fontWeight: FontWeight.bold),),

        Text(detail,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 9,fontWeight: FontWeight.normal),),


      ],
    );

  }
  _centerDatePrice(String date,String price){
    return Center(
      child: Column(
       mainAxisAlignment:MainAxisAlignment.center ,
        crossAxisAlignment:CrossAxisAlignment.center ,
        children: [
          Text(date,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.normal),),

          RichText(
            text: TextSpan(children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(2, -4),
                  child: Text(
                    r'$',
                    //superscript is usually smaller in size
                    textScaleFactor: 0.7,
                    style: GoogleFonts.poppins(color: Mycolor.electricBlue,fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextSpan(
                  text:' '+ price,
                  style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 15,fontWeight: FontWeight.bold)),

            ]),
          )
        ],
      ),
    );
  }
_topNavButtons(){
  int navChoice =  context.watch<TabIndex>().count;
 if(navChoice ==0)
  return Row(
    mainAxisAlignment:MainAxisAlignment.spaceAround ,
    children: [
      FlatButton(
        padding: EdgeInsets.all(0),

        onPressed: (){
          setState(() {
            context.read<TabIndex>().today();
          });},

        child: Column(
          children: [

            Text('Past',style: GoogleFonts.poppins(color: Mycolor.electricBlue,fontSize: 12,fontWeight: FontWeight.bold),),

            Container(height: 10,),
            Container(
              width: 100,
              height: 2,color: Mycolor.electricBlue,)
          ],
        ),
      ),

      FlatButton(
        padding: EdgeInsets.all(0),

        onPressed: (){
          setState(() {
            context.read<TabIndex>().weekly();
          });},
        child: Column(
          children: [
            Text('Upcoming',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold),),
            Container(height: 10,),

            Container(
              width: 100,
              height: 1.2,color: Mycolor.h1color,)
          ],
        ),
      ),
      FlatButton(
        padding: EdgeInsets.all(0),

        onPressed: (){
          setState(() {
            context.read<TabIndex>().business();
          });},
        child: Column(
          children: [
            Text('Business',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold),),
            Container(height: 10,),

            Container(
              width: 100,
              height: 1.2,color: Mycolor.h1color,)
          ],
        ),
      ),
    ],
  );


 if(navChoice ==1)
   return Row(
     mainAxisAlignment:MainAxisAlignment.spaceAround ,
     children: [
       FlatButton(
         padding: EdgeInsets.all(0),

         onPressed: (){
           setState(() {
             context.read<TabIndex>().today();
           });},
         child: Column(
           children: [

             Text('Past',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold),),

             Container(height: 10,),
             Container(
               width: 100,
               height: 1.2,color: Mycolor.h1color,)
           ],
         ),
       ),
       FlatButton(
         padding: EdgeInsets.all(0),

         onPressed: (){
           setState(() {
             context.read<TabIndex>().weekly();
           });},
         child: Column(
           children: [
             Text('Upcoming',style: GoogleFonts.poppins(color: Mycolor.electricBlue,fontSize: 12,fontWeight: FontWeight.bold),),
             Container(height: 10,),

             Container(
               width: 100,
               height: 2,color: Mycolor.electricBlue,)
           ],
         ),
       ),
       FlatButton(
         padding: EdgeInsets.all(0),

         onPressed: (){
           setState(() {
             context.read<TabIndex>().business();
           });},
         child: Column(
           children: [
               Text('Business',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold),),
             Container(height: 10,),

             Container(
               width: 100,
               height: 1.2,color: Mycolor.h1color,)
           ],
         ),
       ),
     ],
   );

 if(navChoice ==2)
   return Row(
     mainAxisAlignment:MainAxisAlignment.spaceAround ,
     children: [
       FlatButton(
         padding: EdgeInsets.all(0),

         onPressed: (){
           setState(() {
             context.read<TabIndex>().today();
           });},
         child: Column(
           children: [

             Text('Past',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold),),

             Container(height: 10,),
             Container(
               width: 100,
               height: 1.2,color: Mycolor.h1color,)
           ],
         ),
       ),

       FlatButton(
         padding: EdgeInsets.all(0),

         onPressed: (){
           setState(() {
             context.read<TabIndex>().weekly();
           });},
         child: Column(
           children: [
             Text('Upcoming',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold),),
             Container(height: 10,),

             Container(
               width: 100,
               height: 1.2,color: Mycolor.h1color,)
           ],
         ),
       ),
       FlatButton(
         padding: EdgeInsets.all(0),

         onPressed: (){
           setState(() {
             context.read<TabIndex>().business();
             // isSchool =2;
           });},
         child: Column(
           children: [
             Text('Business',style: GoogleFonts.poppins(color: Mycolor.electricBlue,fontSize: 12,fontWeight: FontWeight.bold),),
             Container(height: 10,),

             Container(
               width: 100,
               height: 2,color: Mycolor.electricBlue,)
           ],
         ),
       ),
     ],
   );









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
