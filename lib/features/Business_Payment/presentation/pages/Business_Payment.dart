import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
import 'package:passenger/features/write_bank_card/presentation/pages/write_bank_card.dart';

enum PaymntScreen{
 personal,
  business

}

enum PaymntOptinon{
  visa,
  paypal,
  cash

}

class Business_Payment extends StatefulWidget {
  @override
  _Business_PaymentState createState() => _Business_PaymentState();
}

class _Business_PaymentState extends State<Business_Payment> {



  TextEditingController promoCtrl =   TextEditingController();
  bool isCorrectNumber = false;
  CountryCode Country_code =CountryCode();

  PaymntScreen pl =  PaymntScreen.personal;
  PaymntOptinon paymntOptinon   =PaymntOptinon.paypal;



  @override
  void initState() => promoCtrl.addListener(() {


    });



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor:Mycolor.backgroundColor,

      body: Container(

        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Common_Widgets_Class.TopBarWithBlueTop(context,(){
              Navigator.pop(context);
            },'Add Payment',''),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Column(
                      children: [
                        _PaymentOptionTile(),

                        _buttonText('By continuing, I confirm that i have read & agree to the',' Terms of Service',' and ','Privacy Policy',(){}),
                        _BigBlueButton('Next',(){
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);


                        }),
                      ],

                    ),





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

  _PaymentOptionTile(){
    return Column(children: [
      Container(height: 5,),
      Container(
        alignment:Alignment.centerLeft ,
        child: Text(
          'Payment Options',
          style: GoogleFonts.poppins(
              color: Mycolor.h1color,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
      ),
      _optionTile(PaymntOptinon.visa,paymntOptinon== PaymntOptinon.visa,'assets/ui/vehicles/visa.png','VISA','123*******'),
      _optionTile(PaymntOptinon.paypal,paymntOptinon== PaymntOptinon.paypal, 'assets/ui/vehicles/paypal.png','Paypal','john@msn.com'),
      _optionTile(PaymntOptinon.cash,paymntOptinon== PaymntOptinon.cash,'assets/ui/vehicles/denominnation.png','Cash',''),
      _addPaymentOptionButon((){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Write_Bank_Card() ,
            ));
      }),
      Container(height: 20,),

      Container( width: MediaQuery.of(context).size.width * 0.8,height: 2,color: Mycolor.h1color.withOpacity(0.2),),

      Container(height: 5,),
      // Container(
      //   alignment:Alignment.centerLeft ,
      //   child: Text(
      //     'Promo Code',
      //     style: GoogleFonts.poppins(
      //         color: Mycolor.h1color,
      //         fontSize: 13,
      //         fontWeight: FontWeight.bold),
      //   ),
      // ),
      // _getPromoCodeTextField(promoCtrl)

    ],);

  }
  _optionTile(po , istrue,img,upperheading,lowerheading){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FlatButton(
        onPressed: (){
          print(po);
          print(paymntOptinon);
          setState(() {
            paymntOptinon = po;

          });
        },
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          crossAxisAlignment:CrossAxisAlignment.center ,
          children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.start ,
             crossAxisAlignment:CrossAxisAlignment.start ,

            children: [Image.asset(img,width: 45,),
              Container(width: 15,),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start ,

                children: [
                  Text(
                    upperheading,
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),

                  Text(
                    lowerheading,
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
            istrue?Icon(Icons.check,color: Mycolor.electricBlue,):Container()

        ],),
      ),
    );
  }

  _Business_personal_Tab(paymntScreen,fun){
    if(paymntScreen==PaymntScreen.business)
      {
        return Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround ,
          children: [

            FlatButton(

              onPressed: fun,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 28,
                  ),
                  Text(
                    'Personal',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              padding: EdgeInsets.only(left: 15, bottom: 2, top: 2, right: 15),
              color: Mycolor.h1color.withOpacity(0.7),
            ),
            FlatButton(

              onPressed: fun,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/ui/vehicles/briefcase.png',height: 18,),
                  Container(width: 4,),
                  Text(
                    'Business',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              padding: EdgeInsets.only(left: 15, bottom: 2, top: 2, right: 15),
              color: Mycolor.electricBlue,
            ),
            Container(width: 20,height: 5,)
          ],
        );
      }
    else{

      return Row(
mainAxisAlignment:MainAxisAlignment.spaceAround ,
        children: [

          FlatButton(

            onPressed: fun,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 28,
                ),
                Text(
                  'Personal',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            padding: EdgeInsets.only(left: 15, bottom: 2, top: 2, right: 15),
            color: Mycolor.electricBlue,
          ),
          FlatButton(

            onPressed: fun,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/ui/vehicles/briefcase.png',height: 18,),
                Container(width: 4,),
                Text(
                  'Business',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            padding: EdgeInsets.only(left: 15, bottom: 2, top: 2, right: 15),
            color: Mycolor.h1color.withOpacity(0.7),
          ),
          Container(width: 20,height: 5,)
        ],
      );

    }

  }
  _addPaymentOptionButon(fun
      ){

    return Row(
      mainAxisAlignment:MainAxisAlignment.start ,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 180,
          height: 30,
          child: FlatButton(


            onPressed: fun, child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add,color: Colors.white,size: 17,),
              Container(width: 5,),
              Expanded(child: Text('Add Payment Option ',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
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
  _getPromoCodeTextField(promoCtrl){
    return  Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,

      // padding: EdgeInsets.only(left: 20),
      child: TextField(

controller: promoCtrl,

        obscureText: true,

          decoration: InputDecoration(

hintText: "Add promo",



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
            Text(str,style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),

          ],
        ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),

        padding: EdgeInsets.only(left: 10,bottom: 15,top: 15,right: 10),
      color: Mycolor.electricBlue,

      ),
    );

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
            TextSpan(text: str1, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.normal)),
            TextSpan(text: str2, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold)),
            TextSpan(text: str3, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.normal)),
            TextSpan(text: str4, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.bold)),

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
