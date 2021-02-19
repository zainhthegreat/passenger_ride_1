//
// // ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
//
// class White_black with ChangeNotifier, DiagnosticableTreeMixin {
//   int _isWhite = 0;
//
//   int get isWhite => _isWhite;
//
//   void increment() {
//     print('chaneign');
//     //_isWhite++;
//     if(_isWhite==0)
//       _isWhite = 1;
//     else if(_isWhite==1)
//       _isWhite = 0;
//
//
//
//     notifyListeners();
//   }
//
//   /// Makes `White_black` readable inside the devtools by listing all of its properties
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', isWhite));
//   }
// }
