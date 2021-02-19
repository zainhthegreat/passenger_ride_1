import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/features/Add_payment/presentation/pages/add_payment.dart';
import 'package:passenger/features/Welcome_school_run/presentation/pages/welcome_school_run.dart';
import 'package:passenger/features/legal/presentation/pages/legal.dart';
import 'package:passenger/features/maps/presentation/pages/maps.dart';
import 'package:passenger/features/your-trips/presentation/pages/your-trips.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/popUpWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/Drawer/presentation/pages/drawer_core.dart';
import 'package:passenger/features/Welcome_business_run/presentation/pages/welcome_business_run.dart';
import 'package:passenger/features/payment/presentation/pages/payment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passenger/features/Select_your_fleet/presentation/bloc/provider/JourneyStoryState.dart';
import 'package:passenger/features/Select_your_fleet/presentation/pages/select_your_fleet.dart';
class Drawer_MainScreen extends StatefulWidget {
  @override
  _Drawer_MainScreenState createState() => _Drawer_MainScreenState();


}

class _Drawer_MainScreenState extends State<Drawer_MainScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Widget screenwid;

  @override
  void initState() {
    // TODO: implement initState
    screenwid =  Maps(() {
      _drawerKey.currentState.openDrawer();
    });


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: MultiLevelDrawer(
          width: 300,
          backgroundColor: Colors.white,
          rippleColor: Colors.white,
          subMenuBackgroundColor: Colors.grey.shade100,
          header: Container(
            // Header for Drawer
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/ui/selectPicture/selectPicture.png",
                      width: 70,
                      height: 70,
                    ),
                    Expanded(
                        child: Common_Widgets_Class.getDrawerHeading(
                            'Ali Ahmed', 'Good morning,', '3.24')),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.black12,
                )
              ],
            ),
          ),
          children: [
            // Child Elements for Each Drawer Item

            MLMenuItem(
                leading: Image.asset(
                  r'assets/ui/drawerIcon/yourTripsIcon.png',
                  height: 22,
                ),
                content: Text('Your Trips',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Your_trips(),));


                }),
            MLMenuItem(
                leading: Image.asset(
                  'assets/ui/drawerIcon/businessIcon.png',
                  height: 22,
                ),
                content: Text('Business',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome_Business_run(),));

                }),
            MLMenuItem(
                leading: Image.asset(
                  'assets/ui/drawerIcon/schoolIcon.png',
                  height: 22,
                ),
                content: Text('School Run',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome_School_run(),));


                }),
            MLMenuItem(
                leading: Image.asset(
                  'assets/ui/drawerIcon/paymentIcon.png',
                  height: 22,
                ),
                content: Text('Payment',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));


                }),
            MLMenuItem(
                leading: Image.asset(
                  r'assets/ui/drawerIcon/freetripsIcon.png',
                  height: 22,
                ),
                content: Text('Free Trips',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {}),

            MLMenuItem(
                leading: Image.asset(
                  r'assets/ui/drawerIcon/settingsIcon.png',
                  height: 22,
                ),
                content: Text('Settings',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {}),
            MLMenuItem(
                leading: Image.asset(
                  r'assets/ui/drawerIcon/siginOutIcon.png',
                  height: 22,
                ),
                content: Text('Sign Out',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 16,
                      child: Container(
                        height: 120.0,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: PopUpWidgets.SignOutAlret(context, (){}),
                      ),
                    ),
                  );
                  // Navigator.push(context, MaterialPageRoute(builder:(context) => ,))
                }),
            MLMenuItem(
                leading: Image.asset(
                  r'assets/ui/drawerIcon/legalIcon.png',
                  height: 22,
                ),
                content: Text('Legal',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Legal(),));
                }),
          ],
          lowerChildren: [
            MLMenuItem(
                content: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Do more\n',
                              style: GoogleFonts.poppins(
                                  color: Mycolor.h1color.withOpacity(0.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Rate us on store\nRide.com.pk',
                              style: GoogleFonts.poppins(
                                  color: Mycolor.h1color.withOpacity(0.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)),
                        ]),
                      ),
                    ],
                  ),
                ),
                onClick: () {}),
          ],
        ),
        body: screenwid,
      ),
    );

    // return SafeArea(
    //     child: Scaffold(
    //   backgroundColor:Mycolor.backgroundColor,
    //
    //   body: Container(
    //     height: MediaQuery.of(context).size.height,
    //     child: ListView(
    //
    //       children: [
    //         Common_Widgets_Class.Topbar(context,(){Navigator.pop(context);},'WELCOME'),
    //         Padding(
    //           padding: const EdgeInsets.only(right: 15,left: 15),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //
    //               Common_Widgets_Class.getMasterHeading('Welcome!'),
    //               _getTextFieldColumn('Phone number ',phnctrl,isCorrectNumber, (CountryCode countrycode){
    //                 print(countrycode.dialCode + phnctrl.text);
    //               }),
    //               _getPasswordField(false,psdctrl),
    //               _buttonText('Forgot password?',(){}),
    //
    //               _BigBlueButton('Login',(){
    //               Navigator.push(context, MaterialPageRoute(builder: (context) => Drawer_MainScreenUp(),));
    //                 // Drawer_MainScreen_In
    //               }),
    //               _buttonText('Create My Account',(){
    //
    //               }),
    //               _otherSignInOption(),
    //
    //             //  _upperTextWid(), _getCrousel(), _bottomWid(),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
    //
  }

  _upperTextWid() {
    return Expanded(
        child: Container(
            child: Text(helloScreenUpper,
                style: Theme.of(context).textTheme.headline1)));
  }

  _getCrousel() {
    return Expanded(
        child: Container(
            child: Text(helloScreenUpper,
                style: Theme.of(context).textTheme.headline1)));
  }

  _bottomWid() {
    return Expanded(
        child: Container(
            child: Text(helloScreenUpper,
                style: Theme.of(context).textTheme.headline1)));
  }

  _getcountryDropDown(fun) {
    return CountryCodePicker(
      onChanged: fun,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'PK',
      favorite: ['+92', 'PK'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: false,
    );
  }

  _getTextFieldColumn(label, ctrl, istrue, fun) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              color: Mycolor.h1color,
              fontSize: 12,
              fontWeight: FontWeight.normal),
        ),
        _getTextField(ctrl, TextInputType.number, istrue, fun),
      ],
    );
  }

  _getTextField(TextEditingController ctrl, TextInputType tctip, isvisible,
      codeNumberFun) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      alignment: Alignment.center,
      child: TextField(
          controller: ctrl,
          keyboardType: tctip,
          decoration: InputDecoration(
            prefixIcon: _getcountryDropDown(codeNumberFun),
            suffixIcon: isvisible
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Mycolor.primaryColor,
                      size: 28,
                    ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // border: UnderlineInputBorder(
            //   borderSide: BorderSide(color:  Colors.transparent),
            // ),
          )),
    );
  }

  _getPasswordField(isvisible, psdctrl) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,

      // padding: EdgeInsets.only(left: 20),
      child: TextField(
          controller: psdctrl,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: isvisible
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Mycolor.primaryColor,
                      size: 28,
                    ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),

            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.transparent),
            // ),
            // border: UnderlineInputBorder(
            //   borderSide: BorderSide(color:  Colors.transparent),
            // ),
          )),
    );
  }

  _getTopRow(back) {
    return Row(
      children: [
        FlatButton(
            onPressed: back,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        Text('data')
      ],
    );
  }

  _BigBlueButton(String str, Function fun) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlatButton(
        onPressed: fun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              str,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0)),
        padding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 10),
        color: Mycolor.electricBlue,
      ),
    );

    _loginButton(fun) {}
  }

  _buttonText(str, fun) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: fun,
      color: Colors.transparent,
      child: Text(
        str,
        style: GoogleFonts.poppins(
            color: Mycolor.h1color,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  _otherSignInOption() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Or Sign In Using',
              style: GoogleFonts.poppins(
                  color: Mycolor.h1color,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 17.0,
                  backgroundImage:
                      AssetImage('assets/ui/signinoption/facebook.png'),
                  backgroundColor: Colors.transparent,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                CircleAvatar(
                  radius: 22.0,
                  backgroundImage:
                      AssetImage('assets/ui/signinoption/google.png'),
                  backgroundColor: Colors.transparent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
