import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passenger/core/enums/signinMethod.dart';
import 'package:passenger/core/modals/UserModal.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:passenger/core/services/Auth/AuthRoutine.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'FleetRequestModal.g.dart';

@JsonSerializable()
class FleetRequestModal with ChangeNotifier {
String  fleetId =  "string";
String  name =  "string";
String icon =  "string";
var  minFare =  0.0;
var   arrivalTime =  0;

  FleetRequestModal({
    @required this.fleetId ,
    @required this.name ,
    @required this.icon ,
    @required this.minFare ,
    @required this.arrivalTime ,
  });

  // loginWithPhonePassword(){}
  // loginWithFacebook(){}
  // loginWithGoogle(){}
  //

  factory FleetRequestModal.fromJson(Map<String, dynamic> json) =>
      _$FleetRequestModalFromJson(json);


  toJson() => _$FleetRequestModalToJson(this);


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
