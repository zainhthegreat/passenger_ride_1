

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FindingMatch extends StatefulWidget {
  const FindingMatch() ;

  @override
  _FindingMatchState createState() => _FindingMatchState();
}

class _FindingMatchState extends State<FindingMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.primaryColor,
      body: Container(
        color: Colors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Finding Match',style: GoogleFonts.poppins(color: Mycolor.primaryColor,fontSize: 30,fontWeight: FontWeight.bold),),
          Container(
            height: 35,
          ),
          SleekCircularSlider(
          appearance: CircularSliderAppearance(
            spinnerMode: true,
              customColors:CustomSliderColors(
            progressBarColors: [Colors.blueAccent,
            Colors.deepPurple],

                trackColor: Colors.transparent,
                dotColor: Colors.blueAccent
              ),
          )),
        ],
      ),
    )

      ),
    );
  }
}
