
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


enum JournyStoryState {
  main,
  finidngCar,
  Arriving,
  Arrived,
  Reaching,
  RateDriver



}
class JourneyProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _journeyState = 0;

  int get count => _journeyState;

  void main() {
    _journeyState = JournyStoryState.main.index;
    notifyListeners();
  }

  void finidngCar() {
    _journeyState =JournyStoryState.finidngCar.index;
    print(_journeyState);

    notifyListeners();


    Future.delayed(const Duration(seconds: 3), () {
      print('Hello, world');
      Arriving();
    });

  }
  void Arriving() {
    _journeyState=JournyStoryState.Arriving.index;
    notifyListeners();
    Future.delayed(const Duration(seconds: 10), () {
      print('Hello, world');
      // Arrived();
    });
  }
  void Arrived() {
    _journeyState=JournyStoryState.Arrived.index;
    notifyListeners();

    Future.delayed(const Duration(seconds: 10), () {
      print('Hello, world');
      Reaching();
    });

  }
  void Reaching() {
    _journeyState=JournyStoryState.Reaching.index;
    notifyListeners();
    Future.delayed(const Duration(seconds: 10), () {
      print('Hello, world');
      RateDriver();
    });

  }
  void RateDriver() {
    _journeyState=JournyStoryState.RateDriver.index;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));

}}