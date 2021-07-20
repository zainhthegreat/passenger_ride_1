import 'package:country_code_picker/country_code_picker.dart';
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


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:passenger/features/select-car-1/presentation/pages/select_car_1.dart';
// Your api key storage.




class Maps extends StatefulWidget {
  const Maps(this.closefun,{Key key}) : super(key: key);
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

  static final CameraPosition _kLake = CameraPosition(
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
                    right: 20,
                    bottom: 80,
                    child: Container(
                        height: 40,

                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width * 0.9,

                        child: Material(
                          elevation:15,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:     Icon(Icons.gps_fixed,color: Mycolor.electricBlue,size: 20,),
                          ),
                        )
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 20,
                    child: Container(
                      height: 40,

                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,

                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (){
                           // Navigator. push(context,MaterialPageRoute(builder: (context) => Select_car_1(widget.),));

                         },
                        child: Material(
                          elevation:15,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.circle,color: Mycolor.electricBlue,size: 13,),
                                Container(width: 10,),
                                Text('Where To Go?',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),)
                              ],
                            ),
                          ),
                        ),
                      )
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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

