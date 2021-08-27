
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passenger/core/enums/signinMethod.dart';
import 'package:passenger/core/modals/UserModal.dart';

import 'package:json_annotation/json_annotation.dart';

part 'CreateUserRequestModal.g.dart';

@JsonSerializable()
class CreateUserRequestModal with ChangeNotifier {
  UserModal user;
  String fcmToken;
  LoginMethod loginMethod;

  CreateUserRequestModal({
    @required this.user,asdf,


    @required this.fcmToken,
    @required this.loginMethod,
  });


  /*
     "passenger": {
    "passengerId": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "photoUri": "string",
    "homeAddress": "string",
    "update": true,
    "id": "string",
    "new": true
  },
  "fcmToken": "string",
  "loginMethod": "PHONE"
}
   */


  // loginWithPhonePassword(){}
  // loginWithFacebook(){}
  // loginWithGoogle(){}
  //

  factory CreateUserRequestModal.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestModalFromJson(json);


 toJson() => _$CreateUserRequestModalToJson(this);


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
