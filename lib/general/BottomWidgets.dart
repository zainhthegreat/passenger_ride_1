import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/variables.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'dart:async';
import 'package:passenger/features/sigin-otp/presentation/pages/siginInOtpScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:passenger/features/message_driver/presentation/pages/message_driver.dart';
import 'package:passenger/general/popUpWidgets.dart';
class Bottom_widgets {
  Bottom_widgets() {}

  static Widget WhereToGo(context ,fun){
    return Container(
        height: 40,

        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*0.9,

        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: fun,
          child: Material(
            elevation:15,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.circle,color: Mycolor.electricBlue,size: 13,),
                  Container(width: 10,),
                  Text('Where To Go?',style: GoogleFonts.poppins(color: Mycolor.h1color,fontSize: 16,fontWeight: FontWeight.normal),)



                ],
              ),
            ),
          ),
        )
    );

  }
  static Widget Matching(context, fun) {
    return Container(
      height: 140,

      width: MediaQuery.of(context).size.width* 0.9,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          // side: BorderSide(color: Colors.red)
        ),
        color: Mycolor.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Matching...',
              style: GoogleFonts.poppins(
                  color: Mycolor.h1color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 5,
            ),
            Expanded(
              child: Container(
                width: 200,

                child: Text(
                  'Please wait while we connect you to a driver',
                  style: GoogleFonts.poppins(
                      color: Mycolor.electricBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,

                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 1,
              color: Mycolor.h1color.withOpacity(0.1),
            ),
            _BigBlueButton(context,'Cancel', (){
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 16,
                  child: Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: PopUpWidgets.CanelRide(context, (){}),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
  static Widget Arriving(context, fun) {
  return   Padding(
    padding: const EdgeInsets.only(right: 25),
    child: SizedBox(

      // decoration: BoxDecoration(
      //   color: Colors.transparent,
      //
      //   // borderRadius: BorderRadius.only(
      //   //     topLeft: Radius.circular(20), topRight: Radius.circular(20))
      // ),
height: MediaQuery.of(context).size.height * 0.5,

width: MediaQuery.of(context).size.width,
      child: DraggableBottomSheet(
blurBackground: false,

          previewChild: Container(

            decoration: BoxDecoration(
              color: Colors.transparent,
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.white,
                ),
                Expanded(
                  child:       Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width* 0.9,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                        // side: BorderSide(color: Colors.red)
                      ),
                      color: Mycolor.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Mycolor.electricBlue,
                                      size: 18,
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Text(
                                      '2 Minutes',
                                      style: GoogleFonts.poppins(
                                          color: Mycolor.electricBlue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/ui/vehicles/denominnation.png',
                                      height: 12,
                                    ),
                                    Container(
                                      width: 5,
                                    ),
                                    Text(
                                      '200 PKR',
                                      style: GoogleFonts.poppins(
                                          color: Mycolor.electricGreen,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 10,
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 1,
                              color: Mycolor.h1color.withOpacity(0.1),
                            ),
                            Container(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment:CrossAxisAlignment.start ,

                                children: [
                                  Expanded(
                                    child: _getDriverDetail(
                                        'https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg',
                                        'zais',
                                        'AEZ-3002',
                                        'White',
                                        'Lancer',
                                        '4.5',
                                        context),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:CrossAxisAlignment.start ,
                                      children: [
                                        FlatButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Message_Driver(),));

                                          },
                                          child: Image.asset(
                                            'assets/ui/vehicles/messageIcon.png',
                                            height: 45,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 10,
                                        ),
                                        // Image.asset(
                                        //   'assets/ui/vehicles/callIcon.png',
                                        //   height: 50,
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 1,
                              color: Mycolor.h1color.withOpacity(0.1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _BigBlueButton(context,'Cancel', (){
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      elevation: 16,
                                      child: Container(
                                        height: 120.0,
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        child: PopUpWidgets.ArrivingCancel(context, (){}),
                                      ),
                                    ),
                                  );
                                }),
                                _BigBlueButton(context,'Change Dropoff', fun)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          expandedChild: Container(

            decoration: BoxDecoration(
                color: Colors.transparent,
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.white,
                ),

                Expanded(
                  child:       Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width* 0.9,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                        // side: BorderSide(color: Colors.red)
                      ),
                      color: Mycolor.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Mycolor.electricBlue,
                                      size: 18,
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Text(
                                      '2 Minutes',
                                      style: GoogleFonts.poppins(
                                          color: Mycolor.electricBlue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/ui/vehicles/denominnation.png',
                                      height: 12,
                                    ),
                                    Container(
                                      width: 5,
                                    ),
                                    Text(
                                      '200 PKR',
                                      style: GoogleFonts.poppins(
                                          color: Mycolor.electricGreen,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 10,
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 1,
                              color: Mycolor.h1color.withOpacity(0.1),
                            ),
                            Container(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment:CrossAxisAlignment.start ,

                                children: [
                                  Expanded(
                                    child: _getDriverDetail(
                                        'https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg',
                                        'zais',
                                        'AEZ-3002',
                                        'White',
                                        'Lancer',
                                        '4.5',
                                        context),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:CrossAxisAlignment.start ,
                                      children: [
                                        FlatButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Message_Driver(),));

                                          },
                                          child: Image.asset(
                                            'assets/ui/vehicles/messageIcon.png',
                                            height: 45,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 10,
                                        ),
                                        // Image.asset(
                                        //   'assets/ui/vehicles/callIcon.png',
                                        //   height: 50,
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 1,
                              color: Mycolor.h1color.withOpacity(0.1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _BigBlueButton(context,'Cancel', (){
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      elevation: 16,
                                      child: Container(
                                        height: 120.0,
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        child: PopUpWidgets.ArrivingCancel(context, (){}),
                                      ),
                                    ),
                                  );
                                }),
                                _BigBlueButton(context,'Change Dropoff', fun)
                              ],
                            ),
                            Flexible(
                              // height: 50,
                              // width: MediaQuery.of(context).size.width,
                              child: ListView.builder(itemCount: 12,itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(child: Text('ADD',style: TextStyle(color: Colors.white),),color: Colors.red,),
                              ),
                                scrollDirection:Axis.horizontal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          minExtent: 193,
          maxExtent: MediaQuery.of(context).size.height * 0.5,
        ),
    ),
  );

    // return Container(
    //   height: 160,
    //   width: MediaQuery.of(context).size.width* 0.9,
    //   child: Material(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    //       // side: BorderSide(color: Colors.red)
    //     ),
    //     color: Mycolor.backgroundColor,
    //     child: Padding(
    //       padding: const EdgeInsets.only(left: 18, right: 18),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Container(
    //                 width: 10,
    //               ),
    //               Row(
    //                 children: [
    //                   Icon(
    //                     Icons.access_time,
    //                     color: Mycolor.electricBlue,
    //                     size: 18,
    //                   ),
    //                   Container(
    //                     width: 10,
    //                   ),
    //                   Text(
    //                     '2 Minutes',
    //                     style: GoogleFonts.poppins(
    //                         color: Mycolor.electricBlue,
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 children: [
    //                   Image.asset(
    //                     'assets/ui/vehicles/denominnation.png',
    //                     height: 12,
    //                   ),
    //                   Container(
    //                     width: 5,
    //                   ),
    //                   Text(
    //                     '200 PKR',
    //                     style: GoogleFonts.poppins(
    //                         color: Mycolor.electricGreen,
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 width: 10,
    //               ),
    //             ],
    //           ),
    //           Container(
    //             width: MediaQuery.of(context).size.width * 0.8,
    //             height: 1,
    //             color: Mycolor.h1color.withOpacity(0.1),
    //           ),
    //           Container(
    //             width: 10,
    //           ),
    //           Container(
    //             width: MediaQuery.of(context).size.width,
    //             child: Row(
    //               crossAxisAlignment:CrossAxisAlignment.start ,
    //
    //               children: [
    //                 Expanded(
    //                   child: _getDriverDetail(
    //                       'https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg',
    //                       'zais',
    //                       'AEZ-3002',
    //                       'White',
    //                       'Lancer',
    //                       '4.5',
    //                       context),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Row(
    //                     crossAxisAlignment:CrossAxisAlignment.start ,
    //                     children: [
    //                       FlatButton(
    //                         padding: EdgeInsets.all(0),
    //                         onPressed: (){
    //                           Navigator.push(context, MaterialPageRoute(builder: (context) => Message_Driver(),));
    //
    //                         },
    //                         child: Image.asset(
    //                           'assets/ui/vehicles/messageIcon.png',
    //                           height: 45,
    //                         ),
    //                       ),
    //                       Container(
    //                         width: 10,
    //                       ),
    //                       Container(
    //                         width: 10,
    //                       ),
    //                       // Image.asset(
    //                       //   'assets/ui/vehicles/callIcon.png',
    //                       //   height: 50,
    //                       // ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             width: MediaQuery.of(context).size.width * 0.8,
    //             height: 1,
    //             color: Mycolor.h1color.withOpacity(0.1),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               _BigBlueButton(context,'Cancel', (){
    //                 showDialog(
    //                   context: context,
    //                   builder: (context) => Dialog(
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(15)),
    //                     elevation: 16,
    //                     child: Container(
    //                       height: 120.0,
    //                       width: MediaQuery.of(context).size.width * 0.9,
    //                       child: PopUpWidgets.ArrivingCancel(context, (){}),
    //                     ),
    //                   ),
    //                 );
    //               }),
    //               _BigBlueButton(context,'Change Dropoff', fun)
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
  static Widget Arrived(context, fun) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width* 0.9,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          // side: BorderSide(color: Colors.red)
        ),
        color: Mycolor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 10,
                  ),
                  Row(
                    children: [

                      Text(
                        'Driver has Arrived',
                        style: GoogleFonts.poppins(
                            color: Mycolor.electricRed,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ui/vehicles/denominnation.png',
                        height: 12,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        '200 PKR',
                        style: GoogleFonts.poppins(
                            color: Mycolor.electricGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1,
                color: Mycolor.h1color.withOpacity(0.1),
              ),
              Container(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: _getDriverDetail(
                          'https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg',
                          'zais',
                          'AEZ-3002',
                          'White',
                          'Lancer',
                          '4.5',
                          context),
                    ),
                    Row(
                      children: [
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Message_Driver(),));

                          },
                          child: Image.asset(
                            'assets/ui/vehicles/messageIcon.png',
                            height: 45,
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/ui/vehicles/callIcon.png',
                          height: 45,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1,
                color: Mycolor.h1color.withOpacity(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BigBlueButton(context,'Cancel', (){
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 16,
                        child: Container(
                          height: 120.0,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: PopUpWidgets.ArrivingCancel(context, (){}),
                        ),
                      ),
                    );

                  }),
                  _BigBlueButton(context,'Change Dropoff', fun)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  static Widget Reaching(context, fun) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width* 0.9,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          // side: BorderSide(color: Colors.red)
        ),
        color: Mycolor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Mycolor.electricBlue,
                        size: 18,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        '2 Minutes',
                        style: GoogleFonts.poppins(
                            color: Mycolor.electricBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ui/vehicles/denominnation.png',
                        height: 12,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        '200 PKR',
                        style: GoogleFonts.poppins(
                            color: Mycolor.electricGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: 10,
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1,
                color: Mycolor.h1color.withOpacity(0.1),
              ),
              Container(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: _getDriverDetail(
                          'https://upload.wikimedia.org/wikipedia/commons/0/05/Alexander_Hamilton_portrait_by_John_Trumbull_1806.jpg',
                          'zais',
                          'AEZ-3002',
                          'White',
                          'Lancer',
                          '4.5',
                          context),
                    ),
                    Row(
                      children: [
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Message_Driver(),));

                          },
                          child: Image.asset(
                            'assets/ui/vehicles/messageIcon.png',
                            height: 45,
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/ui/vehicles/callIcon.png',
                          height: 45,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 1,
                color: Mycolor.h1color.withOpacity(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BigBlueButton(context,'Cancel', (){
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 16,
                        child: Container(
                          height: 120.0,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: PopUpWidgets.ArrivingCancel(context, (){}),
                        ),
                      ),
                    );

                  }),
                  _BigBlueButton(context,'Change Dropoff', fun)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  static Widget RateDriver(context, fun) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width* 0.9,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          // side: BorderSide(color: Colors.red)
        ),
        color: Mycolor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 10,
                ),
                Container(

                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 3,
                  color: Mycolor.h1color.withOpacity(0.4),
                ),
                Container(
                  width: 20,
                  height: 10,
                ),
                _ratingStar('3'),
                Text(
                  'Muhammad Khan',
                  style: GoogleFonts.poppins(
                      color: Mycolor.h1color.withOpacity(0.4), fontSize: 13, fontWeight: FontWeight.bold),
                ),
                _BigBlueButton(context,'Rate Rider',fun)

              ],
            ),
          ),
        ),
      ),
    );
  }

}

_BigBlueButton(context,String str, Function fun) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: FlatButton(
      onPressed: fun,
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              str,
              style: GoogleFonts.poppins(
                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)),
      padding: EdgeInsets.only(right: 15, left: 15),
      color: Mycolor.electricBlue,
    ),
  );

  _loginButton(fun) {}
}

_getDriverDetail(picUrl, name, carnumber, carcolor, carname, rating, context) {
  return Container(
    height: 70,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          color: Mycolor.h1color.withOpacity(0.2),
          height: 1,
          // width: MediaQuery.of(context).size.width ,
        ),


        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  CircleAvatar(
                    radius: 22.0,
                    backgroundImage: NetworkImage(picUrl),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: GoogleFonts.poppins(
                                  color: Mycolor.h1color,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Text(
                              rating,
                              style: GoogleFonts.poppins(
                                  color: Colors.amber,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          carcolor + ' ' + carname,
                          style: GoogleFonts.poppins(
                              color: Mycolor.h1color,
                              fontSize: 10,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          carnumber,
                          style: GoogleFonts.poppins(
                              color: Mycolor.h1color,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

_ratingStar(String rating) {
  return RatingBar.builder(

    onRatingUpdate: (d) {},
    initialRating: double.parse(rating),
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: true,
    unratedColor: Colors.black.withAlpha(50),
    itemCount: 4,
    itemSize: 28.0,
    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
    itemBuilder: (context, _) => Stack(
      children: [
        Icon(
          Icons.circle,
          color: Mycolor.electricBlue,
        ),
        Positioned(
          top: 3,
          left: 3,
          child: Icon(
            Icons.star,
            color: Mycolor.backgroundColor,
            size: 18,
            // size: 15,
          ),
        ),
      ],
    ),
    updateOnDrag: true,
  );
}
