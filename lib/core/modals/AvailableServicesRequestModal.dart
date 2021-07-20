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

part 'AvailableServicesRequestModal.g.dart';

@JsonSerializable()
class AvailableServicesRequestModal with ChangeNotifier {
 String serviceId = "string";
 String  serviceName = "string";
 String  serviceIcon = "string";
 var serviceFare = 0.0;
 int arrivalTime = 0;

  AvailableServicesRequestModal({
   @required this. serviceId,
   @required this. serviceName,
   @required this. serviceIcon,
   @required this. serviceFare,
   @required this. arrivalTime,
  });



  factory AvailableServicesRequestModal.fromJson(Map<String, dynamic> json) =>
      _$AvailableServicesRequestModalFromJson(json);


 toJson() => _$AvailableServicesRequestModalToJson(this);




}
