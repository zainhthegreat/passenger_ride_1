


import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:passenger/core/modals/UserModal.dart';

import 'package:passenger/core/modals/FleetRequestModal.dart';
import 'package:passenger/core/modals/AvailableServicesRequestModal.dart';
import 'package:passenger/core/modals/BookingRequestModal.dart';
import 'package:http/http.dart' as http;
import 'package:passenger/schemas/fleets.dart';
import 'package:passenger/schemas/location.dart';
import 'package:passenger/schemas/service.dart';
import '../../../util.dart';

class BookingRoutine{

    final UserModal user;
    final BuildContext context;
    BookingLocation _bookingLocation = BookingLocation();


    BookingRoutine({
      @required this.context,
  @required this.user,

});


    List<FleetRequestModal> _FleetRequestModalList=[];
    List<AvailableServicesRequestModal> _AvailableServicesRequestModalList=[];



   getFleetListfromLocal(var selectedServiceTypeId,var estimatedFare, LatLng sourceLocation){
     print("trying to get from lcoal ");
     log('trying to get from lcoal');


     if(_FleetRequestModalList.isNotEmpty)
    return _FleetRequestModalList;

     log("getting dat afrom remote ");

     return _getFleetListfromRemote(selectedServiceTypeId,estimatedFare, sourceLocation);
  }

  //TODO send selectedServiceTypeId,var estimatedFare from select_car to fleet...
   _getFleetListfromRemote(var selectedServiceTypeId,var estimatedFare, LatLng sourceLocation) async {


     // Fleets F=Fleets("33a06879-91ef-4155-a21f-cb95af7c1aa5",Location(32.1,71),"111.401566");
     //
     // var url=Uri.parse("http://ec2-34-243-253-36.eu-west-1.compute.amazonaws.com:31200/rideservice/booking/available_fleets");
     // var response=await http.post(url, headers: <String, String>{
     //   'Content-Type': 'application/json; charset=UTF-8',
     // },body:jsonEncode(F.toJson()));


     Fleets F=Fleets("33a06879-91ef-4155-a21f-cb95af7c1aa5",Location(32.1,71),"111.401566");

     var url=Uri.parse("http://ec2-34-243-253-36.eu-west-1.compute.amazonaws.com:31200/rideservice/booking/available_fleets");
     var response=await http.post(url, headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
     },body:jsonEncode(F.toJson()));



     // String available_fleetsUrl = 'booking/available_fleets';
     // String requestURL = serverUrl_ride+ available_fleetsUrl;
     // print(requestURL);
     // var response   =await http.get( Uri.parse(requestURL));
     if(response.statusCode!=200) return null;

     print("FleetShit" + response.statusCode.toString());
     // List fleetList = jsonDecode(response.body);
     // _FleetRequestModalList=[];
     // fleetList.forEach((element) {
     //   FleetRequestModal returningFleet =FleetRequestModal.fromJson(element);
     //   _FleetRequestModalList.add(returningFleet);
     //   print(returningFleet.name);
     //   print(returningFleet);
     // });
     // _FleetRequestModalList = FleetRequestModalList;
     //









     QuerySnapshot qs= await FirebaseFirestore.instance.collection('fleet').get() ;


     List<FleetRequestModal> FleetRequestModalList=[];
     qs.docs.forEach((element) {
       log(element.data().toString());

       FleetRequestModal returningFleet =FleetRequestModal.fromJson(element.data());

       FleetRequestModalList.add(returningFleet);
       print(returningFleet.name);
     });
     _FleetRequestModalList = FleetRequestModalList;



     return   _FleetRequestModalList;
   }


   getServicesfromLocal() async {
     if(_AvailableServicesRequestModalList.isNotEmpty)
    return _AvailableServicesRequestModalList;

    return await _getServicesfromRemote();}

   _getServicesfromRemote() async {

     Service S=Service(Location(32,71.1),Location(32.1,71.1));
     print(jsonEncode(S.toJson()));

     var url=Uri.parse("$baseURL/rideservice/booking/available_services");
     var response=await http.post(url, headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
     },body:jsonEncode(S.toJson()));



     print("RESPONSE CODE SERVICES     ${response.statusCode}");

     print("RESPONSE Body     ${jsonDecode(response.body)}");

     List fleetList = jsonDecode(response.body);
     fleetList.forEach((element) {
       AvailableServicesRequestModal returningFleet =AvailableServicesRequestModal.fromJson(element);
       _AvailableServicesRequestModalList.add(returningFleet);
       print(returningFleet.serviceName);
     });

     return _AvailableServicesRequestModalList;

     //
     // String available_fleetsUrl = 'booking/available_services';
     // String requestURL = serverUrl_ride+ available_fleetsUrl;
     // print(requestURL);
     // var response   =await http.get( Uri.parse(requestURL));
     // if(response.statusCode!=200) return null;
     //
     // List fleetList = jsonDecode(response.body);
     // List<AvailableServicesRequestModal> AvailableServicesRequestModalList=[];
     // fleetList.forEach((element) {
     //   AvailableServicesRequestModal returningFleet =AvailableServicesRequestModal.fromJson(element);
     //   AvailableServicesRequestModalList.add(returningFleet);
     //   print(returningFleet.serviceName);
     // });
     // _AvailableServicesRequestModalList = AvailableServicesRequestModalList;
     // return   AvailableServicesRequestModalList;




     QuerySnapshot qs= await FirebaseFirestore.instance.collection('services').get() ;



     List<AvailableServicesRequestModal>AvailableServicesRequestModalList=[];
     qs.docs.forEach((element) {
       print('########    1');

       AvailableServicesRequestModal returningFleet =AvailableServicesRequestModal.fromJson(element.data());
       AvailableServicesRequestModalList.add(returningFleet);

     });
     _AvailableServicesRequestModalList = AvailableServicesRequestModalList;


     return   AvailableServicesRequestModalList;


   }

   addBookingfromRemote(BookingRequestModal bookingRequestModal) async {


     var body = bookingRequestModal.toJson();
   //  body =  convert.jsonEncode(body);
     // print(body);
     // String available_fleetsUrl = 'booking/add';
     // String requestURL = serverUrl_ride+ available_fleetsUrl;
     // print(requestURL);
     // var response   =await http.post( Uri.parse(requestURL),body: body,
     //   headers: <String, String>{
     //     'Content-Type': 'application/json; charset=UTF-8',
     //   },
     // );
     // print(response.statusCode);
     // if(response.statusCode!=200){return null;}
     // if(response.body.toString().isEmpty) return null;
     //
     // Map addBookingResponse = jsonDecode(response.body);
     // BookingRequestModal newbookingRequestModal  =   BookingRequestModal.fromJson(addBookingResponse);
     // return newbookingRequestModal;
     DocumentReference dr= await FirebaseFirestore.instance.collection('booking').add(body) ;
     BookingRequestModal newbookingRequestModal  =   BookingRequestModal.fromJson(body);
     return newbookingRequestModal;

   }




    BookingLocation  getBookingLocatiion(){
     return _bookingLocation;
    }

    setBookinglocation(LatLng start ,LatLng end,  ){
     _bookingLocation.endLocation = end;
         _bookingLocation.startLocation= start;

    }
}



class BookingLocation{

  LatLng startLocation;
  LatLng endLocation;

}