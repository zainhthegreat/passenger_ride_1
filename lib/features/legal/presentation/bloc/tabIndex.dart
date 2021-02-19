
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabIndex with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
  void today(){
    _count=0;
    notifyListeners();
  }
  void weekly(){
    _count=1;
    notifyListeners();
  }
  void business(){
    _count=2;
    notifyListeners();
  }
  /// Makes `TabIndex` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
