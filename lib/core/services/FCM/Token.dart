import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FCM_Firebase {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String> getFCM() async {
    // if (Platform.isIOS) iOS_Permission();
    return await _firebaseMessaging.getToken();
  }

  // void iOS_Permission() {
  //   _firebaseMessaging.requestNotificationPermissions(
  //       IosNotificationSettings(sound: true, badge: true, alert: true));
  //   _firebaseMessaging.onIosSettingsRegistered
  //       .listen((IosNotificationSettings settings) {
  //     print("Settings registered: $settings");
  //   });
  // }
}
