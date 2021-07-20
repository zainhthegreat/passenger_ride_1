import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/features/passenger-profile/presentation/pages/PassengerProfileScreen.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
import 'package:passenger/features/sigin-otp/presentation/pages/siginInOtpScreen.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:passenger/features/select-car-1/presentation/pages/select_car_1.dart';
import 'package:passenger/features/Select_your_fleet/presentation/bloc/provider/JourneyStoryState.dart';
import 'package:passenger/general/BottomWidgets.dart';

// Your api key storage.
import 'package:provider/provider.dart';




class Maps extends StatefulWidget {
  User user;

   Maps(this.user,this.closefun,{Key key}) : super(key: key);
  final Function closefun;
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

    CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: Column(
          children: [
            Container(),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Positioned(
                    top: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Mycolor.backgroundColor,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Material(

                        // elevation: 50,
                        shadowColor: Mycolor.backgroundColor,

                        color: Mycolor.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0,right: 0),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                  onPressed:widget.closefun,
                                  child: Image.asset('assets/ui/drawerIcon/menu-left-alt.png' ,width: 22,)),
                              Consumer<JourneyProvider>(
                                builder: (context, state, child) {
return   getTopic(state.count);
                                },
                              ),

                              FlatButton(
                                padding: EdgeInsets.all(0),
                                 onPressed: (){

                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => Pasenger_Profile(),
                                       ));
                                 },
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                 NetworkImage('https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg'),
                                  backgroundColor: Colors.blue,
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 100,
                    left: 22,
                    child: Consumer<JourneyProvider>(
                      builder: (context, state, child) {
                        return getMiddleWidget(state.count);
                      },
                    ),
                  ),




                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 45,

                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width ,

                            child: RaisedButton(
                            shape:  CircleBorder(),
                              elevation:15,
                              onPressed: (){
                              print("novwfi");
                              move_to_current_location();},
                              // borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:     Icon(Icons.gps_fixed,color: Mycolor.electricBlue,size: 20,),
                              ),
                            )
                        ),
                        Container(height: 10,),
                        Consumer<JourneyProvider>(
                          builder: (context, state, child) {
                            return getBottomWidget(state.count);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // ),
      ),
    );
  }
move_to_current_location(){
  _goToTheLake();

}
  getTopic(i){

    if(i ==0)
      return  _headingText(' ');


    if(i ==1)
      return  _headingText(' ');



    if(i ==2)
      return  _headingText('Arriving');


    if(i ==3)
      return  _headingText('Arrived');



    if(i ==4)
      return  _headingText('Reaching Destination');


    if(i ==5)
      return  _headingText('');


  }
getMiddleWidget(i){
    if(i!=JournyStoryState.main.index  && i!=JournyStoryState.finidngCar.index)
      {
        return    _getFromToTripTile('Centaurus Mall','FAST NUCES Islamabad');


}
return Container();
}
  getBottomWidget(i){
    print(i);


    if(i ==JournyStoryState.main.index)
    return  Padding(
      padding: const EdgeInsets.only(bottom: 40,left: 20),
      child: Bottom_widgets.WhereToGo(context,(){
        Navigator. push(context,MaterialPageRoute(builder: (context) => Select_car_1(widget.user  ),));
      }),
    );


    if(i ==JournyStoryState.finidngCar.index)
      return Bottom_widgets.Matching(context,(){
        context.read<JourneyProvider>().main();
      });



    if(i ==JournyStoryState.Arriving.index)
      return Bottom_widgets.Arriving(context,(){
        context.read<JourneyProvider>().main();
      });


    if(i ==JournyStoryState.Arrived.index)
      return Bottom_widgets.Arrived(context,(){
        context.read<JourneyProvider>().main();

      });


    if(i ==JournyStoryState.Reaching.index)
      return Bottom_widgets.Reaching(context,(){
        context.read<JourneyProvider>().main();

      });

    if(i ==JournyStoryState.RateDriver.index)
      return Bottom_widgets.RateDriver(context,(){
        context.read<JourneyProvider>().main();

      });

    return Text('provider works 1',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

    if(i ==2)
      return Text('provider works  2',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

    if(i ==3)
      return Text('provider works  3 ',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

    if(i ==4)

      return Text('provider works  4',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);


      return Text('def ',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

  }
  _getFromToTripTile(String from, String to){
    return Material(
      elevation: 20,
      color: Mycolor.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

      child:   Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(



          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(

                children: [

                  Icon(Icons.circle,color: Mycolor.electricBlue,size: 12,),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),

                  Icon(Icons.circle,color: Mycolor.electricBlue,size: 12,),



                ],



              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child:   Column(

                crossAxisAlignment:CrossAxisAlignment.start ,

                children: [

                  _upperTextWid('From'),

                  _lowerText("Centaurus Mall"),

                  Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Container(
                      height: 0.5,

                      width: MediaQuery.of(context).size.width * 0.7,

                      color: Mycolor.h1color,

                    ),
                  ),

                  _upperTextWid('To'),

                  _lowerText("FAST NUCES Islamabad")

                ],

              ),
            ),

          ],

        ),
      ),
    );

  }
  _upperTextWid(helloScreenUpper) {
    return Container(
        child:Text(helloScreenUpper,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.normal),)

    );
  }
  _headingText(str){
    return   Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 15,fontWeight: FontWeight.bold),);


  }

  _lowerText(str){
    return   Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.bold),);


  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}