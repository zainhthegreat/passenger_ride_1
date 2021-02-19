import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/CommonWidgets.dart';
import 'package:passenger/general/strings.dart';
import 'package:passenger/general/variables.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/custom-rides/presentation/pages/rideListTime_widget.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:passenger/features/custom-rides/presentation/pages/rideListTime_widget.dart';
import 'package:passenger/features/your-trips/presentation/pages/tripListTile_widget.dart';
import 'package:passenger/features/your-trips/presentation/pages/nav_bar_row.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/material.dart';

class RidesListToday{
  List <Widget>ls= [];
  RidesListToday(){
    initToday();
  }
initToday(){

  ls.add(Trip_ListTile('5000','Model Town','Kala shahkakhu', 'Toyota Prius','Ali','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('400','bahria','Pakstan Town', 'Toyota Prius','Kashif','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('1200','Gulberg','Do Talwar', 'Toyota Prius','Usman','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));
  ls.add(Trip_ListTile('2300','DHA','MURREE', 'Toyota Prius','Umar','4.5',DateTime.now(),));


}


}

class RidesListWeekly{
  List <Widget>ls= [];
  RidesListWeekly(){
    initWeekly();
  }
  initWeekly()  {

    ls.add(Trip_ListTile('8200','G 11','Bani Gala', 'Toyota Prius','Tom','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('12300','F 8','Bani Gala', 'Toyota Prius','Alex','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('200','I 9','Bani Gala', 'Mitsubishi Lancer','Josh','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('10','B 12','Bani Gala', 'Toyota Aqua','Kumar','4.5',DateTime.now(),));


  }


}class RidesListBusiness{
  List <Widget>ls= [];

  RidesListBusiness(){
    initBusiness();
  }
  initBusiness(){
    ls.add(Trip_ListTile('5200','GreenWood street','Bani Gala', 'Toyota Prius','Netanyahu','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('3500','Time square','Bani Gala', 'Toyota Prius','Abel','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('4500','Empire state   ','Bani Gala', 'Bina','Ali Hassan','4.5',DateTime.now(),));
    ls.add(Trip_ListTile('5400','CN tower','Hill road', 'Toyota Prius','Bess','4.5',DateTime.now(),));
  }


}