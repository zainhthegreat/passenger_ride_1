
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class AvailableServicesRequestModal {
    String serviceTypeId;
    String serviceName;
    int baseFare;
    int baseFarePerMile;
    int subsequentFare;
    int subsequentFarePerMile;
    int farePerMinute;
    int driverCancelTimeLimit;
    int driverCancelCharges;
    int waitingTimeLimitAtArrival;
    int cancelAfterArrivalCharges;
    int maxPassengersLimit;
    String photoUri;
    int nightTimeCharges;
    bool update;
    String id;
    bool new_;

 AvailableServicesRequestModal({this.serviceTypeId, this.serviceName, this.baseFare, this.baseFarePerMile, this.subsequentFare, this.subsequentFarePerMile, this.farePerMinute, this.driverCancelTimeLimit, this.driverCancelCharges, this.waitingTimeLimitAtArrival, this.cancelAfterArrivalCharges, this.maxPassengersLimit, this.photoUri, this.nightTimeCharges, this.update, this.id, this.new_});

AvailableServicesRequestModal.fromJson(Map<String, dynamic> json) {
serviceTypeId = json['serviceTypeId'];
serviceName = json['serviceName'];
baseFare = json['baseFare'];
baseFarePerMile = json['baseFarePerMile'];
subsequentFare = json['subsequentFare'];
subsequentFarePerMile = json['subsequentFarePerMile'];
farePerMinute = json['farePerMinute'];
driverCancelTimeLimit = json['driverCancelTimeLimit'];
driverCancelCharges = json['driverCancelCharges'];
waitingTimeLimitAtArrival = json['waitingTimeLimitAtArrival'];
cancelAfterArrivalCharges = json['cancelAfterArrivalCharges'];
maxPassengersLimit = json['maxPassengersLimit'];
photoUri = json['photoUri'];
nightTimeCharges = json['nightTimeCharges'];
update = json['update'];
id = json['id'];
new_ = json['new'];
}

Map<String, dynamic> toJson() {
 final Map<String, dynamic> data = new Map<String, dynamic>();
 data['serviceTypeId'] = this.serviceTypeId;
 data['serviceName'] = this.serviceName;
 data['baseFare'] = this.baseFare;
 data['baseFarePerMile'] = this.baseFarePerMile;
 data['subsequentFare'] = this.subsequentFare;
 data['subsequentFarePerMile'] = this.subsequentFarePerMile;
 data['farePerMinute'] = this.farePerMinute;
 data['driverCancelTimeLimit'] = this.driverCancelTimeLimit;
 data['driverCancelCharges'] = this.driverCancelCharges;
 data['waitingTimeLimitAtArrival'] = this.waitingTimeLimitAtArrival;
 data['cancelAfterArrivalCharges'] = this.cancelAfterArrivalCharges;
 data['maxPassengersLimit'] = this.maxPassengersLimit;
 data['photoUri'] = this.photoUri;
 data['nightTimeCharges'] = this.nightTimeCharges;
 data['update'] = this.update;
 data['id'] = this.id;
 data['new'] = this.new_;
 return data;
}
}

























// part 'AvailableServicesRequestModal.g.dart';
//
// @JsonSerializable()
//
// class AvailableServicesRequestModal with ChangeNotifier {
//  String serviceId = "string";
//  String  serviceName = "string";
//  String  serviceIcon = "string";
//  var serviceFare = 0.0;
//  int arrivalTime = 0;
//
//   AvailableServicesRequestModal({
//    @required this. serviceId,
//    @required this. serviceName,
//    @required this. serviceIcon,
//    @required this. serviceFare,
//    @required this. arrivalTime,
//   });
//
//
//
//   factory AvailableServicesRequestModal.fromJson(Map<String, dynamic> json) =>
//       _$AvailableServicesRequestModalFromJson(json);
//
//
//  toJson() => _$AvailableServicesRequestModalToJson(this);
//
//
//
//
// }
