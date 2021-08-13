import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passenger/core/modals/CreateUserRequestModal.dart';
import 'package:passenger/core/modals/UserModal.dart';
// import 'package:passenger/core/services/FCM/Token.dart';
import 'package:passenger/features/Drawer/presentation/pages/DrawerMaster.dart';
import 'package:passenger/features/JourneyStory/presentation/pages/maps.dart';
import 'package:passenger/features/signupTerms/presentation/pages/signUpTermsScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:passenger/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthRoutine {


  InititeRoutine({
    @required User user,
    BuildContext context,
  }) async {
    print("USER 4");

    String FCM_code = await getFCMtoken();
    bool userIsReturning = await does_user_exist(user.uid, FCM_code);
    if (userIsReturning) {
      get_user(user.uid);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Drawer_MainScreen(user: user,),
          ));
    } else {
      // await resgister_user(CreateUserRequestModal(fcmToken: FCM_code,loginMethod: ,password: ,user: ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SiginUpTerms(user.uid)));
    }
  }


  Future<UserCredential> signInWithGoogle(
      {@required BuildContext context}) async {
    // Trigger the authentication flow
    print("USER 1");
    await Firebase.initializeApp();
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    print("USER 2");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("USER 3");
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("USER 4");

    InititeRoutine(user: FirebaseAuth.instance.currentUser, context: context);
  }

  Future<UserModal> get_user(String uid) async {

String fcm = await getFCMtoken();

    String restore_passenger_profileURL = 'login/restore_passenger_profile?passengerId=${uid}&fcmToken=${fcm}';
    // String requestURL = serverUrl_passenger+ restore_passenger_profileURL;
    // print(requestURL);
    // var response   =await http.get( Uri.parse(requestURL));
    //   Map userMap = jsonDecode(response.body);
    // UserModal returningUser =UserModal.fromJson(userMap);
    //         print(returningUser.passengerId);



DocumentSnapshot ds   = await FirebaseFirestore.instance.collection('user').doc(uid).get() ;
return  UserModal.fromJson(ds.data());
 //   return   returningUser;
  }

  Future resgister_user(CreateUserRequestModal createUserRequestModal) async {

    createUserRequestModal.fcmToken =await getFCMtoken();


    String registeruserURL = 'login/register_passenger';
    String requestURL = serverUrl_passenger+ registeruserURL;
   print(requestURL);

   var body =createUserRequestModal.toJson();
   print(body);
   body =  convert.jsonEncode(body);
   print(body);


   //  var response   =await http.post( Uri.parse(requestURL),body: body,
   //    headers: <String, String>{
   //      'Content-Type': 'application/json; charset=UTF-8',
   //    },
   //  );
   //  print("response.body");
   //  print(response.statusCode);
   //
   //  if(response.statusCode!=200){ return null;}

    Map<String, dynamic> data = jsonDecode(body);
   var returnData = await FirebaseFirestore.instance.collection('user').doc(createUserRequestModal.user.passengerId).set(data) ;




    Map responsemp = convert.jsonDecode(body) ;

    print(responsemp);


    return UserModal.fromJson(responsemp);


  }

  Future<bool> does_user_exist(String uid, String FCM) async {

    String doesUserExistURL = 'login/does_passenger_exist?passengerId=${uid}';
    String requestURL = serverUrl_passenger+ doesUserExistURL;
    print(requestURL);
    print(uid);
    print(FCM);
/*    var response   =await http.get( Uri.parse(requestURL));
    Map responsemp = convert.jsonDecode(response.body) as Map;
    bool value =responsemp['value'];
    print(value);*/
    // using firebase for prototype
    DocumentSnapshot ds   = await FirebaseFirestore.instance.collection('user').doc(uid).get() ;
    return ds.exists;



    // return   value;

  }

  getFCMtoken() async {
    return await FirebaseMessaging.instance.getToken();

  }
}
