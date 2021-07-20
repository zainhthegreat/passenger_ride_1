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

part 'CreateUserRequestModal.g.dart';

@JsonSerializable()
class CreateUserRequestModal with ChangeNotifier {
  UserModal user;
  String password;
  String fcmToken;
  LoginMethod loginMethod;

  CreateUserRequestModal({
    @required this.user,asdf,

    @required this.password,
    @required this.fcmToken,
    @required this.loginMethod,
  });

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
