

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'BookingRequestModal.g.dart';

@JsonSerializable()
class BookingRequestModal with ChangeNotifier {
   String bookingId = "";
   String businessId = "";
   String passengerId = "";
   String driverId = "";
   String fleetId = "";
   String serviceId = "";
   String vehicleId = "";
   String bookingZoneId = "";
   int rideBookingTime = 0;
   int arrivedAtLocationTime = 0;
   int rideStartTime = 0;
   String pob1Id = "";
   String pob2Id = "";
   int estimatedDistance = 0;
   int estimatedFare = 0;
   int estimatedTime = 0;
   int waitingTime = 0;
   int distanceTravelled = 0;
   int timeTaken = 0;
   int fleetSurcharge = 0;
   int fleetDiscount = 0;
   int subTotal = 0;
   int finalTotal = 0;
   int driverRating = 0;
   String driverComments = "";
   double passengerRating =0;
   String passengerComments = "";
   double tip = 0;
   String driverEarningRecordId = "";


  BookingRequestModal({
   @required this.bookingId,
   @required this.businessId,
   @required this.passengerId,
   @required this.driverId,
   @required this.fleetId,
   @required this.serviceId,
   @required this.vehicleId,
   @required this.bookingZoneId,
   @required this.rideBookingTime,
   @required this.arrivedAtLocationTime,
   @required this.rideStartTime,
   @required this.pob1Id,
   @required this.pob2Id,
   @required this.estimatedDistance,
   @required this.estimatedFare,
   @required this.estimatedTime,
   @required this.waitingTime,
   @required this.distanceTravelled,
   @required this.timeTaken,
   @required this.fleetSurcharge,
   @required this.fleetDiscount,
   @required this.subTotal,
   @required this.finalTotal,
   @required this.driverRating,
   @required this.driverComments,
   @required this.passengerRating,
   @required this.passengerComments,
   @required this.tip,
   @required this.driverEarningRecordId,

  });

  // loginWithPhonePassword(){}
  // loginWithFacebook(){}
  // loginWithGoogle(){}
  //

  factory BookingRequestModal.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestModalFromJson(json);


  toJson() => _$BookingRequestModalToJson(this);


// Map<String, dynamic> toJsonWithUser() {
//
//  Map mp = this.toJson();
//
//
//  // var modal  = mp['passenger'];
//  mp['passenger'] = user.toJson();
//  return mp;
//
// }

}
