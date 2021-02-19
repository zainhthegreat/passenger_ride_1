import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:passenger/features/custom-rides/presentation/pages/school_Business.dart';
import 'package:passenger/features/custom-rides/presentation/pages/custom-ridesScreen.dart';
import 'features/Drawer/presentation/pages/DrawerMaster.dart';
import 'features/your-trips/presentation/pages/your-trips.dart  ';
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
import 'package:passenger/features/Select_your_fleet/presentation/pages/select_your_fleet.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

return     ChangeNotifierProvider<JourneyProvider>(
    create: (context) => JourneyProvider(),
child: MaterialApp(
  home: Welcome(),
) ,
);

    return  MaterialApp(
      home: Welcome(),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ride App',
      home: Your_trips(),
    );
  }
}

class ExampleExpert extends StatefulWidget {
  @override
  _ExampleExpertState createState() => _ExampleExpertState();
}

class _ExampleExpertState extends State<ExampleExpert> {
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();
  int _contentAmount = 0;
  ExpansionStatus _expansionStatus = ExpansionStatus.contracted;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ExpandableBottomSheet(
        //use the key to get access to expand(), contract() and expansionStatus
        key: key,

        //optional
        //callbacks (use it for example for an animation in your header)
        onIsContractedCallback: () => print('contracted'),
        onIsExtendedCallback: () => print('extended'),

        //optional; default: Duration(milliseconds: 250)
        //The durations of the animations.
        animationDurationExtend: Duration(milliseconds: 500),
        animationDurationContract: Duration(milliseconds: 250),

        //optional; default: Curves.ease
        //The curves of the animations.
        animationCurveExpand: Curves.bounceOut,
        animationCurveContract: Curves.ease,

        //optional
        //The content extend will be at least this height. If the content
        //height is smaller than the persistentContentHeight it will be
        //animated on a height change.
        //You can use it for example if you have no header.
        persistentContentHeight: 100,

        //required
        //This is the widget which will be overlapped by the bottom sheet.
        background: Container(
          // color: Colors.blue[800],
        ),

        //optional
        //This widget is sticking above the content and will never be contracted.
        persistentHeader: Container(
          color: Colors.orange,
          constraints: BoxConstraints.expand(height: 40),
          child: Center(
            child: Container(
              height: 8.0,
              width: 50.0,
              color: Color.fromARGB((0.25 * 255).round(), 0, 0, 0),
            ),
          ),
        ),

        //required
        //This is the content of the bottom sheet which will be extendable by dragging.
        expandableContent: Container(
            constraints: BoxConstraints(maxHeight: 800),
            child: SingleChildScrollView(child: ListView. builder(itemBuilder: (context, index) => Container(child: Text('Heyy $index',style: TextStyle(color: Colors.black,fontSize: 25)),),itemCount: 25,))
        ),

        //optional
        //This is a widget aligned to the bottom of the screen and stays there.
        //You can use this for example for navigation.

      ),
    );
  }
}

