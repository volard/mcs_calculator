import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// Singleton considered
class ComputingSystemModel extends ChangeNotifier{
  ComputingSystemModel(); // TODO initialize params


  // TODO declare model's params
  bool isCalculated = false;



  void calculate(){
    // TODO calculate params

    isCalculated = true;
    notifyListeners();
  }

}