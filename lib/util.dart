

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/modals/CreateUserRequestModal.dart';
import 'core/modals/UserModal.dart';

var baseURL= "http://ec2-34-246-189-160.eu-west-1.compute.amazonaws.com:8086";

String ipUrl = "192.168.0.117";
String serverUrl_passenger = 'http://${ipUrl}:8086/';//'192.168.10.8/login/does_passenger_exist?passengerId=1';
String serverUrl_ride = 'http://${ipUrl}:8086/';
String GAPIKEY = "AIzaSyAcw16S7ODcY37cMS6R7WE80lerLn98F3g";



const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));



SharedPreferences prefs;


void getSharedPrefs(CreateUserRequestModal userModal) async{


SharedPreferences prefs=await SharedPreferences.getInstance();


prefs.setString("fcmToken", userModal.fcmToken.toString());
prefs.setString("loginMethod", userModal.loginMethod.toString());
prefs.setString("photoUri", userModal.user.photoUri);
prefs.setString("passengerId", userModal.user.passengerId);
prefs.setString("email", userModal.user.email);
prefs.setString("firstName", userModal.user.firstName);
prefs.setString("lastName", userModal.user.lastName);
prefs.setString("homeAddress", userModal.user.homeAddress);
prefs.setBool("loggedIn",true);

print("LOGIN              INFO           GOT                  SUCCESSFULLY");

}
