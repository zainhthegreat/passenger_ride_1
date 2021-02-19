import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/features/passenger-profile/presentation/pages/PassengerProfileScreen.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
import 'package:passenger/features/sigin-otp/presentation/pages/siginInOtpScreen.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:passenger/features/select-car-1/presentation/pages/select_car_1.dart';
import 'package:passenger/features/Select_your_fleet/presentation/bloc/provider/JourneyStoryState.dart';
import 'package:passenger/general/BottomWidgets.dart';

// Your api key storage.
import 'package:provider/provider.dart';




class Maps extends StatefulWidget {
  const Maps(this.closefun,{Key key}) : super(key: key);
  final Function closefun;
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: Column(
          children: [
            Container(),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                     zoomControlsEnabled: false,

                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Positioned(
                    top: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Mycolor.backgroundColor,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Material(

                        // elevation: 50,
                        shadowColor: Mycolor.backgroundColor,

                        color: Mycolor.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0,right: 0),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                  onPressed:widget.closefun,
                                  child: Image.asset('assets/ui/drawerIcon/menu-left-alt.png' ,width: 22,)),
                              Consumer<JourneyProvider>(
                                builder: (context, state, child) {
return   getTopic(state.count);
                                },
                              ),

                              FlatButton(
                                padding: EdgeInsets.all(0),
                                 onPressed: (){

                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (context) => Pasenger_Profile(),
                                       ));
                                 },
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                 NetworkImage('https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg'),
                                  backgroundColor: Colors.blue,
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 100,
                    left: 22,
                    child: Consumer<JourneyProvider>(
                      builder: (context, state, child) {
                        return getMiddleWidget(state.count);
                      },
                    ),
                  ),




                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 40,

                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width * 0.9,

                            child: Material(
                              elevation:15,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:     Icon(Icons.gps_fixed,color: Mycolor.electricBlue,size: 20,),
                              ),
                            )
                        ),
                        Container(height: 10,),
                        Consumer<JourneyProvider>(
                          builder: (context, state, child) {
                            return getBottomWidget(state.count);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // ),
      ),
    );
  }

  getTopic(i){

    if(i ==0)
      return  _headingText(' ');


    if(i ==1)
      return  _headingText(' ');



    if(i ==2)
      return  _headingText('Arriving');


    if(i ==3)
      return  _headingText('Arrived');



    if(i ==4)
      return  _headingText('Reaching Destination');


    if(i ==5)
      return  _headingText('');


  }
getMiddleWidget(i){
    if(i!=JournyStoryState.main.index  && i!=JournyStoryState.finidngCar.index)
      {
        return    _getFromToTripTile('Centaurus Mall','FAST NUCES Islamabad');


}
return Container();
}
  getBottomWidget(i){
    print(i);


    if(i ==0)
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Bottom_widgets.WhereToGo(context,(){
        Navigator. push(context,MaterialPageRoute(builder: (context) => Select_car_1(),));
      }),
    );


    if(i ==1)
      return Bottom_widgets.Matching(context,(){
        context.read<JourneyProvider>().main();
      });



    if(i ==2)
      return Bottom_widgets.Arriving(context,(){
        context.read<JourneyProvider>().main();
      });


    if(i ==3)
      return Bottom_widgets.Arrived(context,(){
        context.read<JourneyProvider>().main();

      });


    if(i ==4)
      return Bottom_widgets.Reaching(context,(){
        context.read<JourneyProvider>().main();

      });

    if(i ==5)
      return Bottom_widgets.RateDriver(context,(){
        context.read<JourneyProvider>().main();

      });

    return Text('provider works 1',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

    if(i ==2)
      return Text('provider works  2',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

    if(i ==3)
      return Text('provider works  3 ',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

    if(i ==4)

      return Text('provider works  4',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);


      return Text('def ',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),);

  }
  _getFromToTripTile(String from, String to){
    return Material(
      elevation: 20,
      color: Mycolor.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

      child:   Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(



          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(

                children: [

                  Icon(Icons.circle,color: Mycolor.electricBlue,size: 12,),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,color: Mycolor.h1color.withOpacity(0.2),size: 5,),
                  ),

                  Icon(Icons.circle,color: Mycolor.electricBlue,size: 12,),



                ],



              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child:   Column(

                crossAxisAlignment:CrossAxisAlignment.start ,

                children: [

                  _upperTextWid('From'),

                  _lowerText("Centaurus Mall"),

                  Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Container(
                      height: 0.5,

                      width: MediaQuery.of(context).size.width * 0.7,

                      color: Mycolor.h1color,

                    ),
                  ),

                  _upperTextWid('To'),

                  _lowerText("FAST NUCES Islamabad")

                ],

              ),
            ),

          ],

        ),
      ),
    );

  }
  _upperTextWid(helloScreenUpper) {
    return Container(
        child:Text(helloScreenUpper,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.normal),)

    );
  }
  _headingText(str){
    return   Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 15,fontWeight: FontWeight.bold),);


  }

  _lowerText(str){
    return   Text(str,style: GoogleFonts.poppins(color: Mycolor.h1color.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.bold),);


  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
//
// class Maps extends StatefulWidget {
//   @override
//   _MapsState createState() => _MapsState();
// }
//
// class _MapsState extends State<Maps> {
//
//
//
//   TextEditingController promoCtrl =   TextEditingController();
//   bool isCorrectNumber = false;
//   CountryCode Country_code =CountryCode();
//
//
//
//
//
//   @override
//   void initState() => promoCtrl.addListener(() {
//
//
//     });
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return new FlutterMap(
//       options: new MapOptions(
//         center: new latLng.LatLng(51.5, -0.09),
//         zoom: 13.0,
//       ),
//       layers: [
//         new TileLayerOptions(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c']
//         ),
//         new MarkerLayerOptions(
//           markers: [
//             new Marker(
//               width: 80.0,
//               height: 80.0,
//               point: new latLng.LatLng(51.5, -0.09),
//               builder: (ctx) =>
//               new Container(
//                 child: new FlutterLogo(),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//
//
//
//   _optionTile(istrue,img,upperheading,lowerheading){
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Row(
//         mainAxisAlignment:MainAxisAlignment.spaceBetween ,
//         crossAxisAlignment:CrossAxisAlignment.center ,
//         children: [
//         Row(
//           mainAxisAlignment:MainAxisAlignment.start ,
//            crossAxisAlignment:CrossAxisAlignment.start ,
//
//           children: [Image.asset(img,width: 45,),
//             Container(width: 15,),
//             Column(
//               crossAxisAlignment:CrossAxisAlignment.start ,
//
//               children: [
//                 Text(
//                   upperheading,
//                   style: GoogleFonts.poppins(
//                       color: Mycolor.h1color,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                 ),
//
//                 Text(
//                   lowerheading,
//                   style: GoogleFonts.poppins(
//                       color: Mycolor.h1color.withOpacity(0.5),
//                       fontSize: 12,
//                       fontWeight: FontWeight.normal),
//                 ),
//               ],
//             ),
//           ],
//         ),
//           istrue?Icon(Icons.check,color: Mycolor.electricBlue,):Container()
//
//       ],),
//     );
//   }
//
//
//   _addPaymentOptionButon(fun
//       ){
//
//     return Row(
//       mainAxisAlignment:MainAxisAlignment.start ,
//       children: [
//         Container(
//           alignment: Alignment.centerLeft,
//           width: 180,
//           height: 30,
//           child: FlatButton(
//
//
//             onPressed: fun, child:Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add,color: Colors.white,size: 17,),
//               Container(width: 5,),
//               Expanded(child: Text('Add Payment Option ',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
//               // Icon(Icons.arrow_forward,color: Colors.white,size: 30,)
//
//             ],
//           ),
//             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
//
//             padding: EdgeInsets.only(left: 5,bottom: 0,top: 0,right: 5),
//             color: Mycolor.electricBlue,
//
//           ),
//         ),
//       ],
//     );
//
//   }
//
//   _getcountryDropDown(fun){
//     return CountryCodePicker(
//       onChanged: fun,
//       // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//       initialSelection: 'PK',
//       favorite: ['+92','PK'],
//       // optional. Shows only country name and flag
//       showCountryOnly: false,
//       // optional. Shows only country name and flag when popup is closed.
//       showOnlyCountryWhenClosed: false,
//       // optional. aligns the flag and the Text left
//       alignLeft: false,
//
//     );
//
//   }
//   _getTextFieldColumn(label,ctrl,istrue,fun ){
//
//     return Column(
// mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//       Text(label,style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 12,fontWeight: FontWeight.normal),),
//     _getTextField(ctrl,TextInputType.number ,istrue,fun),],
//
//     );
//
// }
//   _getTextField(TextEditingController ctrl,  TextInputType tctip,isvisible,codeNumberFun){
//
//     return  Container(
//       width: MediaQuery.of(context).size.width * 0.9,
//       height: 45,
// alignment:Alignment.center ,
//       child: TextField(
//
//         controller: ctrl,
//         keyboardType: tctip,
//           decoration: InputDecoration(
//               prefixIcon: _getcountryDropDown(codeNumberFun),
//               suffixIcon: isvisible?Padding(
//   padding: const EdgeInsets.only(bottom: 10),
//   child:   Icon(Icons.check_circle_rounded,color: Mycolor.primaryColor, size: 28,),
// ):Container(
//                 height: 0,
//                 width: 0,
//               ),
//             // enabledBorder: UnderlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.transparent),
//             // ),
//             // focusedBorder: UnderlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.transparent),
//             // ),
//             // border: UnderlineInputBorder(
//             //   borderSide: BorderSide(color:  Colors.transparent),
//             // ),
//           )
//       ),
//     );
//
//   }
//   _getPromoCodeTextField(promoCtrl){
//     return  Container(
//       width: MediaQuery.of(context).size.width * 0.9,
//       height: 45,
//
//       // padding: EdgeInsets.only(left: 20),
//       child: TextField(
//
// controller: promoCtrl,
//
//         obscureText: true,
//
//           decoration: InputDecoration(
//
// hintText: "Add promo",
//
//
//
//             // enabledBorder: UnderlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.transparent),
//             // ),
//             // focusedBorder: UnderlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.transparent),
//             // ),
//             // border: UnderlineInputBorder(
//             //   borderSide: BorderSide(color:  Colors.transparent),
//             // ),
//           )
//       ),
//     );
//   }
//   _getTopRow( back){
//     return Row(
//       children: [
//         FlatButton(onPressed: back,
//             child: Icon(Icons.arrow_back,color: Colors.white,)),
//         Text('data')
//
//       ],
//     );
//
//
//   }
//   _BigBlueButton(String str,Function fun){
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: FlatButton(
//
//         onPressed: fun, child:Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(str,style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
//
//           ],
//         ),
//         shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
//
//         padding: EdgeInsets.only(left: 10,bottom: 15,top: 15,right: 10),
//       color: Mycolor.electricBlue,
//
//       ),
//     );
//
//     _loginButton(fun){
//
//
//     }
//
//   }
//   _buttonText (str1,str2,str3 ,str4,fun){
//     return       FlatButton(
//       padding:  EdgeInsets.all(0),
//        onPressed: fun,
//       color: Colors.transparent,
//       child:RichText(
//         text: TextSpan(
//
//           children: <TextSpan>[
//             TextSpan(text: str1, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal)),
//             TextSpan(text: str2, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.bold)),
//             TextSpan(text: str3, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal)),
//             TextSpan(text: str4, style:GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.bold)),
//
//           ],
//         ),
//       ) ,
//     );
//
//   }
//   _otherSignInOption(){
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//         Text('Or Sign Up Using',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 14,fontWeight: FontWeight.normal),),
//         Row(
// mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 17.0,
//               backgroundImage:
//               AssetImage('assets/ui/signinoption/facebook.png'),
//               backgroundColor: Colors.transparent,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width* 0.05,
//             ),
//             CircleAvatar(
//               radius: 22.0,
//               backgroundImage:
//               AssetImage  ('assets/ui/signinoption/google.png'),
//               backgroundColor: Colors.transparent,
//             )
//
//
//           ],
//         )
//
//       ],),
//     );
//   }
//
//
// }
