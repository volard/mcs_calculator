import 'package:flutter/foundation.dart';

class ComputingSystemModel extends ChangeNotifier{
  // TODO declare model's params
  bool isReady = false;

  void calculate(){
    // TODO calculate params

    isReady = true;
    notifyListeners();
  }

}