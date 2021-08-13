import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:passenger/core/modals/CreateUserRequestModal.dart';
import 'package:passenger/core/modals/UserModal.dart';
import 'package:passenger/features/custom-rides/presentation/pages/school_Business.dart';
import 'package:passenger/features/custom-rides/presentation/pages/custom-ridesScreen.dart';
import 'package:passenger/features/sigin-otp/presentation/pages/siginInOtpScreen.dart';
import 'package:passenger/features/sigin/presentation/pages/siginInScreen.dart';
import 'package:passenger/features/signup/presentation/pages/signUpScreen.dart';
import 'features/Drawer/presentation/pages/DrawerMaster.dart';
import 'features/TEMP_FEATURES/TempFeatures.dart';
import 'features/your-trips/presentation/pages/your-trips.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:passenger/features/your-trips/presentation/pages/types/TodayRides.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passenger/features/your-trips/presentation/bloc/tabIndex.dart';
import 'package:passenger/features/custom-rides/presentation/pages/rideListTime_widget.dart';
import 'package:passenger/features/your-trips/presentation/pages/tripListTile_widget.dart';
import 'package:passenger/features/your-trips/presentation/pages/nav_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passenger/features/your-trips/presentation/bloc/tabIndex.dart';
import 'package:passenger/features/tripdetails/presentation/pages/trip-details.dart';
import 'package:passenger/features/signup-profile/presentation/pages/siginUpProfileScreen.dart';
import 'package:passenger/features/passenger-profile/presentation/pages/PassengerProfileScreen.dart';
import 'package:passenger/features/Select_Destination/presentation/pages/select-destination.dart';
import 'package:passenger/features/Select_your_car/presentation/pages/select-your-car.dart';
import 'package:passenger/features/Help/presentation/pages/Help.dart';
import 'package:passenger/features/Reciept-details/presentation/pages/reciept-details.dart';
import 'package:passenger/features/message_driver/presentation/pages/message_driver.dart';
import 'package:passenger/features/legal/presentation/pages/legal.dart';
import 'package:passenger/features/write_bank_card/presentation/pages/write_bank_card.dart';
import 'package:passenger/features/Welcome_school_run/presentation/pages/welcome_school_run.dart';
import 'package:passenger/features/Business_one/presentation/pages/business_One.dart';
import 'package:passenger/features/Business_two/presentation/pages/Business_two.dart';
import 'package:passenger/features/Add_payment/presentation/pages/add_payment.dart';
import 'package:passenger/features/School_run_one/presentation/pages/School_run_One.dart';
import 'package:passenger/features/School_run_two/presentation/pages/School_run_two.dart';
import 'package:passenger/features/School_run_three/presentation/pages/School_run_three.dart';
import 'package:passenger/features/Business_Payment/presentation/pages/Business_Payment.dart';
import 'package:passenger/features/maps/presentation/pages/maps.dart';
import 'package:passenger/features/welcome/presentation/pages/welcomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:passenger/features/Select_your_fleet/presentation/bloc/provider/JourneyStoryState.dart';
//import 'package:passenger/features/Select_your_fleet/presenatation/pages/select_your_fleet.dart';
import 'package:firebase_core/firebase_core.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
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
            return SiginUp /*SiginUpScreen*/ ();
          }
        ),
      ),
    );
  }
}
