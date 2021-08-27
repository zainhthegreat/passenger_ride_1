import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/core/modals/UserModal.dart';
import 'package:passenger/features/Select_your_fleet/presentation/pages/select_your_fleet.dart';
import 'package:passenger/features/passenger-profile/presentation/pages/PassengerProfileScreen.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
// import 'package:passenger/features/sigin-otp/presentation/pages/siginInOtpScreen.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:passenger/core/services/BookingRoutine/BookingRoutine.dart';
import 'package:search_map_place/search_map_place.dart';

// Your api key storage.

import 'package:passenger/features/Select_Pickup/presentation/pages/select-pickup.dart';
import 'package:passenger/features/Select_Destination/presentation/pages/select-destination.dart';

import '../../../../util.dart';

enum BookRideRoutine{

  SELECT_SOURCE,
  SOURCE_SELECTED,
  DESTINATION_SELECTED,


}
class Select_car_1 extends StatefulWidget {
  UserModal user;
   Select_car_1(this.user,{Key key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _Select_car_1State createState() => _Select_car_1State();
}

class _Select_car_1State extends State<Select_car_1> {
  Completer<GoogleMapController> _controller = Completer();
  // BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  BookRideRoutine  bookRideRoutine = BookRideRoutine.SELECT_SOURCE;

  // Mode _mode = Mode.overlay;

  LatLng fromMarkerPos = LatLng(0, 0);
  LatLng toMarkerPos = LatLng(0, 0);
  bool selectSource = true;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  String Select_Pickup='Select Pickup';

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting
// two points
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    // TODO: implement initState
    print("cAR 1");
    setSourceAndDestinationIcons();
  }

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
                    onTap: (latlng){
                      if(isSelectingStart()) {
                      moveStartingMarker(latlng);
                    movecameratolocation(latlng);}
                    else{
                        moveDestinationMarker(latlng);
                        movecameratolocation(latlng);
                      }},
                   buildingsEnabled: false,
                    zoomGesturesEnabled: true,
                    markers: _markers,
                    polylines: Set<Polyline>.of(polylines.values),
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);

                      setState(() {
                        _markers.add(Marker(
                            markerId: MarkerId("from"),
                            position: fromMarkerPos,
                            icon: sourceIcon));
                      });
                      _markers.add(Marker(
                          markerId: MarkerId("to"),
                          position: toMarkerPos,
                          icon: destinationIcon));
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
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Mycolor.electricBlue,
                                    size: 22,
                                  )),
                              Text(
                                isSelectingStart()? 'Select Pickup':  'Where To? ',
                                style: GoogleFonts.poppins(
                                    color: Mycolor.h1color,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Pasenger_Profile(widget.user),
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg'),
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
                    top: 80,
                    left: 10,
                    right: 5,
                    child: _getFromToTripTile(
                        Select_Pickup, 'Select_Destination'),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 50,
                    child: Container(
                        height: 100,
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            isSelectingStart()?
                            RaisedButton(
                              onPressed: () {
                                _gotoMyLocation();
                              },
                              shape: CircleBorder(),
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.gps_fixed,
                                  color: Mycolor.electricBlue,
                                  size: 20,
                                ),
                              ),
                            ):Container(),

                            RaisedButton(
                              onPressed: () {
                                if(isSelectingStart()){
                                  setState(() {
                                    bookRideRoutine= BookRideRoutine.SOURCE_SELECTED;

                                  });
                                }
                                else if(isSelectionISComplete()){
                                  addBooking();
                                }
                              },
                              shape: CircleBorder(),
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                 Icons.arrow_forward,
                                  color: Mycolor.electricBlue,
                                  size: 20,
                                ),
                              ),
                            ),



                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _gotoMyLocation,
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // ),
      ),
    );
  }

  _getFromToTripTile(String from, String to) {
    return Material(
      elevation: 20,
      color: Mycolor.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Icon(
                    Icons.circle,
                    color: Mycolor.electricBlue,
                    size: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.circle,
                      color: Mycolor.h1color.withOpacity(0.2),
                      size: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.circle,
                      color: Mycolor.h1color.withOpacity(0.2),
                      size: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.circle,
                      color: Mycolor.h1color.withOpacity(0.2),
                      size: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.circle,
                      color: Mycolor.h1color.withOpacity(0.2),
                      size: 5,
                    ),
                  ),
                  Icon(
                    Icons.circle,
                    color: Mycolor.electricBlue,
                    size: 12,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*            FlatButton(
                      padding:EdgeInsets.all(0),
                       onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Select_Pickup(),));
                       },
                        child: Text(from,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 14,fontWeight: FontWeight.normal))),
*/
                    /*Container(
                           width: MediaQuery.of(context).size.height*0.5,
                            height: 30,


                            child:   TextField(
                            decoration: InputDecoration(hintText: from,hintStyle:  GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 14,fontWeight: FontWeight.normal)),
                            ),
                          ),
                          */

                    SearchMapPlaceWidget(
                      apiKey: GAPIKEY,
                      placeholder: from,
                      onSelected: (Place place) async {
                        Geolocation geolocation = await place.geolocation;
                        LatLng latlng = geolocation.coordinates;
                        moveStartingMarker(latlng);
                        movecameratolocation(latlng);
                      },
                    ),
                    Container(
                      height: 20,
                    ),
                    isSelectingStart()?
                    Container():SearchMapPlaceWidget(
                      apiKey: GAPIKEY,
                      placeholder: to,
                      onSelected: (Place place) async {
                        Geolocation geolocation = await place.geolocation;
                        LatLng latlng = geolocation.coordinates;
                        moveDestinationMarker(latlng);
                        movecameratolocation(latlng);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> _gotoMyLocation() async {

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    if (position==null){
      Alert(
        context: context,
        title: "Turn On GPS",
        type: AlertType.error,

        desc: "Unable to get location ",
          buttons: [
            DialogButton(onPressed: (){Navigator.pop(context);},child: Text("Close"),)
          ]
      ).show();
      return ;
    }
    moveStartingMarker(LatLng(position.latitude,position.longitude));
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(position.latitude,position.longitude),
        tilt: 59.440717697143555,
        zoom: 30)));

    setState(() {

      Select_Pickup =LatLng(position.latitude,position.longitude).toString()  ;

    });

  }

  movecameratolocation(LatLng latLng) async {
    print(latLng.toString());
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: latLng, tilt: 59.440717697143555, zoom: 19.151926040649414)));

    // _gotoMyLocation();
  }

  moveStartingMarker(LatLng pos) async {
    fromMarkerPos = pos;
    bookRideRoutine= BookRideRoutine.SELECT_SOURCE;
    setState(() {
      _markers.removeWhere((m) => m.markerId.value == "from");
      _markers.add(Marker(
          markerId: MarkerId("from"),
          position: pos, // updated position
          icon: sourceIcon));
    });
    if (toMarkerPos.latitude != 0) {
      await makeSureBothLocationsAreInScreen(fromMarkerPos, toMarkerPos);
    }
  }

  moveDestinationMarker(LatLng pos) async {
    toMarkerPos = pos;
    bookRideRoutine= BookRideRoutine.DESTINATION_SELECTED;
    setState(() {
      _markers.removeWhere((m) => m.markerId.value == "to");
      _markers.add(Marker(
          markerId: MarkerId("to"),
          position: pos, // updated position
          icon: destinationIcon));
    });

    if (fromMarkerPos.latitude != 0) {
      await makeSureBothLocationsAreInScreen(fromMarkerPos, toMarkerPos);
    }
  }



  void setSourceAndDestinationIcons() async {
    sourceIcon =
        await BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);

    destinationIcon = await BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor
            .hueViolet) /*BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 25),
        'assets/to_balloon.png')*/
        ;
  }

  makeSureBothLocationsAreInScreen(
      startCoordinates, destinationCoordinates) async {
    print("moving to ine single screen ");
// Define two position variables
    LatLng _northeastCoordinates;
    LatLng _southwestCoordinates;

// Calculating to check that
// southwest coordinate <= northeast coordinate
    if (startCoordinates.latitude <= destinationCoordinates.latitude) {
      _southwestCoordinates = startCoordinates;
      _northeastCoordinates = destinationCoordinates;
    } else {
      _southwestCoordinates = destinationCoordinates;
      _northeastCoordinates = startCoordinates;
    }
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            northeast: LatLng(
              _northeastCoordinates.latitude,
              _northeastCoordinates.longitude,
            ),
            southwest: LatLng(
              _southwestCoordinates.latitude,
              _southwestCoordinates.longitude,
            )),
        25)).then((value) {

      setState(() {
        _createPolylines(startCoordinates,destinationCoordinates);

      });
    });

// Accommodate the two locations within the
// camera view of the map

    // _gotoMyLocation();

  }

// Create the polylines for showing the route between two places

  _createPolylines(LatLng start, LatLng destination) async {


    // Initializing PolylinePoints
    polylinePoints = null;
    polylinePoints = PolylinePoints();
    polylineCoordinates = [];
    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GAPIKEY, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    // Adding the coordinates to the list
    setState(() {

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {

        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    });
    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    setState(() {
      polylines[id] = polyline;
    });
  }
  isSelectingStart(){
    return bookRideRoutine ==BookRideRoutine.SELECT_SOURCE;
    // return fromMarkerPos.latitude==0&&fromMarkerPos.longitude==0;
  }
  isSelectionISComplete(){
    return bookRideRoutine ==BookRideRoutine.DESTINATION_SELECTED;
  }
  addBooking(){


    navigateToNextScreeen();
  }
  navigateToNextScreeen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Select_your_fleet(sourceLocation: fromMarkerPos,destinationLocation:
      toMarkerPos,user: widget.user,),));

  }
}
