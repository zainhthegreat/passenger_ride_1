import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passenger/general/variables.dart';

class Common_Widgets_Class {
  Common_Widgets_Class();

  static Widget TopbarwithChooseProfileImage(
      context, backFunction, label, selectpicture, url, size) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Topbar(context, backFunction, label)),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.12,
          right: MediaQuery.of(context).size.width / 2 - size,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: selectpicture,
            child: CircleAvatar(
              radius: size,
              backgroundImage: url == null
                  ? AssetImage('assets/ui/selectPicture/selectPicture.png')
                  : FileImage(url),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  static Widget TopbarWhiteBase(context, backFunction, label, picUrl) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          // child:Image.asset("assets/ui/topbar/topbar.png",fit: BoxFit.fill,)
          color: Mycolor.backgroundColor,
        ),
        _getTopRowForWhiteBase(backFunction, label, picUrl)
      ],
    );
  }

  static Widget TopBarWithBlueTop(context, backFunction, label, picUrl) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.14,
          // child:Image.asset("assets/ui/topbar/topbar.png",fit: BoxFit.fill,)
          color: Mycolor.electricBlue,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height:  MediaQuery.of(context).size.height * 0.18,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, top: 8, right: 12, left: 8),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: FlatButton(
                    onPressed: backFunction,
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Mycolor.backgroundColor,
                      size: 20,
                    ),
                    padding: EdgeInsets.all(0),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                  child: Text(
                label,
                style: GoogleFonts.poppins(
                    color: Mycolor.backgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
              picUrl.toString().compareTo('') != 0
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 17.0,
                        backgroundImage: NetworkImage(picUrl),
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  : Container(
                      width: 50,
                    ),
            ],
          ),
        )
      ],
    );
  }

  static Widget Topbar(context, backFunction, label) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.asset(
              "assets/ui/topbar/topbar.png",
              fit: BoxFit.fill,
            )),
        _getTopRow(backFunction, label)
      ],
    );
  }

  static Widget getMasterHeadingWithUpperSubHeadingLowerSubHeadingWithBlue(
      Mainlable, subupperlable, lowersubheading, blueowerheading) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subupperlable,
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          Text(
            Mainlable,
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: lowersubheading,
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
                TextSpan(
                    text: blueowerheading,
                    style: GoogleFonts.poppins(
                        color: Mycolor.electricBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget getMasterHeadingWithUpperSubHeading(Mainlable, subupperlable) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subupperlable,
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          Text(
            Mainlable,
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget getDrawerHeading(Mainlable, subupperlable, rating) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subupperlable,
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          Text(
            Mainlable,
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            rating,
            style: GoogleFonts.poppins(
                color: Mycolor.electricBlue,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget getMasterHeading(label) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: Text(
        label,
        style: GoogleFonts.poppins(
            color: Mycolor.h1color, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget getAlertBoxWithTwoParameter(String str, yesFun, noFun) {
    return AlertDialog(
      elevation: 50,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0)),
      content: Text(
        str,
        style: GoogleFonts.poppins(
            color: Mycolor.h1color.withOpacity(0.5),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Yes',
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onPressed: yesFun,
        ),
        FlatButton(
          child: Text(
            'No',
            style: GoogleFonts.poppins(
                color: Mycolor.h1color,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onPressed: noFun,
        ),
        Container(
          width: 50,
        )
      ],
    );

    return Material(
      color: Colors.transparent,
      child: Container(
        height: 200,
        width: 100,
        color: Mycolor.backgroundColor,
        child: Column(
          children: [
            Text(
              str,
              style: GoogleFonts.poppins(
                  color: Mycolor.h1color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: yesFun,
                  child: Text(
                    'Yes',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: noFun,
                  child: Text(
                    'No',
                    style: GoogleFonts.poppins(
                        color: Mycolor.h1color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: Text(
        str,
        style: GoogleFonts.poppins(
            color: Mycolor.h1color, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

_getTopRow(back, label) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FlatButton(
            onPressed: back,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 22,
            ),
            padding: EdgeInsets.all(0),
            color: Colors.transparent,
          ),
        ),
      ),
      Text(
        label,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      )
    ],
  );
}

_getTopRowForWhiteBase(back, label, picUrl) {
  return Container(
    alignment: Alignment.topCenter,
    height: 70,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 8, right: 12, left: 8),
          child: SizedBox(
            height: 50,
            width: 50,
            child: FlatButton(
              onPressed: back,
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Mycolor.electricBlue,
                size: 22,
              ),
              padding: EdgeInsets.all(0),
              color: Colors.transparent,
            ),
          ),
        ),
        Container(
            child: Text(
          label,
          style: GoogleFonts.poppins(
              color: Mycolor.h1color,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )),
        picUrl.toString().compareTo('') != 0
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 17.0,
                  backgroundImage: NetworkImage("dfsddsf..sdfsdfs.fsd.fs"),
                  backgroundColor: Colors.transparent,
                ),
              )
            : Container(
                width: 50,
              ),
      ],
    ),
  );
}
