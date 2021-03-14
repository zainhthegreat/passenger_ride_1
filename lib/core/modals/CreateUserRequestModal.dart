import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passenger/core/enums/signinMethod.dart';
import 'package:passenger/core/modals/UserModal.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:passenger/core/services/Auth/AuthRoutine.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'CreateUserRequestModal.g.dart';


@JsonSerializable()
class CreateUserRequestModal with ChangeNotifier{

   UserModal  user  ;
   String  password  ;
   String  fcmToken  ;
   LoginMethod  loginMethod  ;


    CreateUserRequestModal({
    @required this.user,
    @required this.password,
    @required this.fcmToken,
    @required this.loginMethod,

  });

    signinEvent(phoneNumber) async {
      AuthRoutine authRoutine =  AuthRoutine();
      FirebaseAuth auth = FirebaseAuth.instance;
      verifyPhoneNumber(phoneNumber,auth);

//       authRoutine.resgister_user(this);
      authRoutine.does_user_exist('');
      this.user = await authRoutine.get_user('');

    }
    // loginWithPhonePassword(){}
    // loginWithFacebook(){}
    // loginWithGoogle(){}
    //

  factory CreateUserRequestModal.fromJson(Map<String, dynamic> json) => _$CreateUserRequestModalFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserRequestModalToJson(this);

verifyPhoneNumber(String phoneNumber,FirebaseAuth auth )async{


  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationFailed: (FirebaseAuthException e) {
      FirebaseAuthException p =e;

      // Alert(
      //
      //   context: context,
      //   title: p.code,
      //   desc:p.message,
      // ).show();




    },
    codeSent: (String verificationId, int resendToken) {
      print("CODE SENT");
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context){
      //       return codeEntry(verificationId);
      //     })
      // );

    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    verificationCompleted: (PhoneAuthCredential credential) async {
      PhoneAuthCredential d;


      // credential.
      await auth.signInWithCredential(credential);
      print("LOGGED IN** *");
      print(auth.currentUser.phoneNumber);



    },
  );
}

}
