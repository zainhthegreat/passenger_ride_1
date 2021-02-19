import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:passenger/general/variables.dart';

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
import 'package:passenger/features/write_bank_card/presentation/pages/write_bank_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passenger/features/write_bank_card/presentation/bloc/provider/white-black.dart';

class Card_Module extends StatefulWidget {
  // Card_Module(this.tr);
  // Write_Bank_CardState tr;

  @override
  State<StatefulWidget> createState() {
    return Card_ModuleState();
  }
}

class Card_ModuleState extends State<Card_Module> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;


  bool button = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[

            CreditCardWidget(
              textStyle:  GoogleFonts.poppins(color:Mycolor.backgroundColor,fontSize: 18,fontWeight: FontWeight.normal),
cardType: CardType.mastercard,
              height: 200,
              labelExpiredDate:'MONTH/YEAR' ,

              cardBgColor: Mycolor.cardBG ,

              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(

                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumberDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  _buttonText('By continuing, I confirm that i have read & agree to the',' Terms of Service',' and ','Privacy Policy',(){}),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Remove Credit Card',style: GoogleFonts.poppins(color:Mycolor. h1color,fontSize:10,fontWeight: FontWeight.bold),),
                      RaisedButton(
                        shape: new CircleBorder(),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_forward,color: Colors.white,size: 18,),
                          ),
                        ),
                        color: Mycolor.electricBlue,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);

                          // widget.tr.setState(() {
                          //   print(button);
                          //   button !=button ;
                          //   print(button);
                          //
                          //
                          // });

                          if (formKey.currentState.validate()) {


                            print('valid!');
                          } else {
                            print('invalid!');
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),

            Container(color: Colors.transparent,height: 165,width: 54,),


          ],
        ),
      ),
    );
  }
  _buttonText (str1,str2,str3 ,str4,fun){
    return       Column(
      children: [
        Container(

          height: 20,
          // width: MediaQuery.of(context).size.width ,
        ),
        FlatButton(
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
        ),
      ],
    );

  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  bool card_is_filled(vfv){
    return cardNumber.isNotEmpty && expiryDate.isNotEmpty  && cardHolderName.isNotEmpty && cvvCode.isNotEmpty ;
  }
}