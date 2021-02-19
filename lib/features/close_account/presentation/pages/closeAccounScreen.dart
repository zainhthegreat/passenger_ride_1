import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/signup/presentation/pages/signUpScreen.dart';

class CloseAccount extends StatefulWidget {
  @override
  _CloseAccountState createState() => _CloseAccountState();
}

class _CloseAccountState extends State<CloseAccount> {



  TextEditingController phnctrl =   TextEditingController();
  TextEditingController psdctrl =TextEditingController();


  bool isCorrectNumber = false;

  @override
  void initState() => phnctrl.addListener(() {
      setState(() {
        isCorrectNumber = /*(phnctrl.text.isNumeric() ) &&  */(phnctrl.text.length>9 )?true:false;
             });
    });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor:Mycolor.backgroundColor,

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(

          children: [
            Common_Widgets_Class.Topbar(context,(){Navigator.pop(context);},'BACK'),
            Padding(
              padding: const EdgeInsets.only(right: 15,left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Common_Widgets_Class.getMasterHeading('Close My Account'),
                  _getTextFieldColumn('Why? ',phnctrl),
                  Container(height: 50,),



                  _BigBlueButton('Submit',(){
                    showDialog<void>(
                      context: context,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return    Common_Widgets_Class.getAlertBoxWithTwoParameter('Are you sure you want to sign out?' ,(){},(){});
                      },
                    );

                     // CloseAccount_In
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
  _getTextFieldColumn(label,ctrl){

    return Column(
mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(label,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.normal),),
    _getTextField(ctrl,TextInputType.number ),],

    );

}
  _getTextField(TextEditingController ctrl,  TextInputType tctip,){

    return  Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
alignment:Alignment.center ,
      child: TextField(

        controller: ctrl,
        keyboardType: tctip,
          decoration: InputDecoration(
    hintText: 'Because……'
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

        onPressed: fun, child:Container(
        alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(str,style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),)),
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
