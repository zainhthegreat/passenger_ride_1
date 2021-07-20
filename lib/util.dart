

import 'dart:math';

String ipUrl = "10.0.0.20";
String serverUrl_passenger = 'http://${ipUrl}:8081/';//'192.168.10.8/login/does_passenger_exist?passengerId=1';
String serverUrl_ride = 'http://${ipUrl}:8400/';
String GAPIKEY = "AIzaSyAcw16S7ODcY37cMS6R7WE80lerLn98F3g";



const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
