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
class Message_Driver extends StatefulWidget {
  @override
  _Message_DriverState createState() => _Message_DriverState();
}

class _Message_DriverState extends State<Message_Driver> {

  ScrollController lstScrollController = ScrollController();
  TextEditingController msgCtrl = TextEditingController();
  TextEditingController phnctrl =   TextEditingController();
  bool isCorrectNumber = false;
  CountryCode Country_code =CountryCode();
List<MessageTile> msgTile = [];

@override
  void initState() {
    // TODO: implement initState
  msgTile.add(MessageTile(false,   DateTime.now(),'Lorem sum is simply dummysimply dummy text of the printin'));
  msgTile.add(MessageTile(false,   DateTime.now() , 'Lorem Ipsum is simply dummy'));
  msgTile.add(MessageTile(true,   DateTime.now(),'Lorem Ipsum is simply dummy text of the printin'));
  msgTile.add(MessageTile(false,   DateTime.now() , 'Lorem Ipsum is simply dummy'));



}


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
            Common_Widgets_Class.Topbar(context,(){
              Navigator.pop(context);
            },'BACK'),
            Positioned(

              child: Padding(
                padding: const EdgeInsets.only(right: 15,left: 30,top: 70),
                child: Material(
                  elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                   color: Mycolor.backgroundColor,
                    child: Container(

                        height: MediaQuery.of(context).size.height *0.75,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.center ,

                          children: [
                            Text('TODAY',style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.normal),),
                          Expanded(
                            child: ListView.builder(
                              controller: lstScrollController,
                              itemCount: msgTile.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                print(index);
                                return msgTile[index];


                            },),
                          ),
                            _getTextFiledRowTile()


                          ],
                        ))),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _getTextFiledRowTile(){

  return Container(

    width: MediaQuery.of(context).size.width,

    child: Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children: [
        Expanded(
          child: Container(
            child: _getTextField(msgCtrl,TextInputType.text ,true,(s){



            }),
          ),
        ),

        _BigBlueButton('Send',(){
          setState(() {
            msgTile.add(MessageTile(true,   DateTime.now() , msgCtrl.text));
            // lstScrollController.animateTo(offset, duration: null, curve: null)


            lstScrollController.  jumpTo(lstScrollController.position.maxScrollExtent);

          });

          Timer(
            Duration(milliseconds: 50),
                () => lstScrollController.jumpTo(lstScrollController.position.maxScrollExtent),
          );
          msgCtrl.clear();
        })

      ],
    ),
  );

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

    return  TextField(

      controller: ctrl,
      keyboardType: tctip,
        decoration: InputDecoration(
          hintText: 'Type a message',
              hintStyle: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.w600),
            // prefixIcon: _getcountryDropDown(codeNumberFun),

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
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(str,style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal),),
            Container(width: 5,),
            Icon(Icons.send,color: Colors.white,size: 16,)

          ],
        ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),

        // padding: EdgeInsets.only(left: 10,bottom: 15,top: 15,right: 10),
      color: Mycolor.electricBlue,

      ));

    _loginButton(fun){


    }

  }
  _buttonText (str1,str2,str3 ,str4,fun){
    return       FlatButton(
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