import 'package:passenger/core/enums/signinMethod.dart';
import 'package:passenger/core/modals/CreateUserRequestModal.dart';
import 'package:passenger/core/modals/UserModal.dart';
import 'package:passenger/features/Drawer/presentation/pages/DrawerMaster.dart';
import 'package:passenger/features/welcome/presentation/pages/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../../util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }


  LoginMethod getLoginMethod(String str)
  {
    if(str=="LoginMethod.FACEBOOK")
      return LoginMethod.FACEBOOK;

    if(str=="LoginMethod.GOOGLE")
      return LoginMethod.GOOGLE;

      return LoginMethod.PHONE;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          color: Colors.indigo,
          child: _run(Text('PRIME', style: TextStyle(fontSize: 40,color: Colors.black)), () async {
            prefs = await SharedPreferences.getInstance();

            if(!prefs.containsKey("loggedIn"))
              prefs.setBool("loggedIn",false);

            if (prefs.getBool("loggedIn") == true) {
              print("LOGGED IN");
              CreateUserRequestModal userModal = CreateUserRequestModal(
                fcmToken: prefs.get("fcmToken"),
                loginMethod: getLoginMethod(prefs.get("LoginMethod")),
                user: UserModal(
                  photoUri: prefs.get("photoUri"),
                  passengerId: prefs.get("passengerId"),
                  email: prefs.get("email"),
                  firstName: prefs.get("firstName"),
                  homeAddress: prefs.get("homeAddress"),
                  lastName: prefs.get("lastName"),
                ),
              );

              Navigator.push(context, MaterialPageRoute(builder: (context)=> Drawer_MainScreen(user: userModal.user )));
            }

            else {
              print("NO             IN");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SiginUpScreen()));
            }


          }),
        ),
      ),
    );
  }

  Widget _run(Widget widget, Function fun) {
    fun();
    return widget;
  }
}
