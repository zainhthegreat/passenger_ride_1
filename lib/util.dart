

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

var baseURL= "http://192.168.18.133:8086";

String ipUrl = "192.168.0.117";
String serverUrl_passenger = 'http://${ipUrl}:8086/';//'192.168.10.8/login/does_passenger_exist?passengerId=1';
String serverUrl_ride = 'http://${ipUrl}:8086/';
String GAPIKEY = "AIzaSyAcw16S7ODcY37cMS6R7WE80lerLn98F3g";



const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));





//A must to be used function in main so the shared preferences are to be looked at
SharedPreferences pref;
Future<void> createPref() async {
  pref = await SharedPreferences.getInstance();
}
