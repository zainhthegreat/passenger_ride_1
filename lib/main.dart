import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:passenger/core/modals/CreateUserRequestModal.dart';
import 'package:passenger/core/modals/UserModal.dart';
import 'package:passenger/util.dart';
import 'package:provider/provider.dart';
import 'package:passenger/features/signup-profile/presentation/pages/siginUpProfileScreen.dart';
import 'package:passenger/features/Select_your_fleet/presentation/bloc/provider/JourneyStoryState.dart';
import 'package:firebase_core/firebase_core.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await createPref(); //from util to get shared preferences
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JourneyProvider>(
          create: (_) => JourneyProvider(),
        ),
        ChangeNotifierProvider<CreateUserRequestModal>(
          create: (_) => CreateUserRequestModal(),
        ),
        ChangeNotifierProvider<UserModal>(
          create: (_) => UserModal(),
        ),
        // CreateUserRequestModal
        // UserModal
      ],
      child: MaterialApp(
        home: FutureBuilder(
          future: FirebaseFirestore.instance.collection('services').add({
            'arrivalTime':
            3,
            'serviceFare':
            500,
            'serviceIcon':
            "https://firebasestorage.googleapis.com/v0/b/ride-app-f7742.appspot.com/o/prototype%2Fservice%2FSuzuki_Mehran_2012.jpeg?alt=media&token=b71a5bb6-dcb3-42a3-8536-fc370c5167ae",
            'serviceId':"",
            'serviceName':
            "mehran boom"
          }),
          builder: (context, snapshot) {


            return Sigup_Profile /*SiginUpScreen*/ ("4LdWS6y5peYOxOUMm7JC9a89pc13");
          }
        ),
      ),
    );
  }
}
