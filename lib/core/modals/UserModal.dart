
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UserModal.g.dart';



@JsonSerializable()
class UserModal with ChangeNotifier{


String passengerId ;
String firstName  ;
String lastName  ;
String email  ;
String photoUri ;
String homeAddress ;



UserModal({
 @required this.passengerId,
 @required this.email,
 @required this.lastName,
 @required this.firstName,
 @required this.homeAddress,
 @required this.photoUri
});

factory UserModal. fromJson(Map<String, dynamic> json) => _$UserModalFromJson(json);
Map<String, dynamic> toJson() => _$UserModalToJson(this);


}