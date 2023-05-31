import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// Singleton considered
class ComputingSystemModel extends ChangeNotifier{
  ComputingSystemModel(); // TODO initialize params


  // TODO declare model's params
  bool isCalculated = false;

  // ---------- INPUT
  // Input stream intensity
  double? lambda;

  // Service time
  double mu = 1;

  // Pending capacity
  double? m;

  // Channels quantity
  double? n;


  // ---------- OUTPUT
  // Load factor
  double? rho;

  // Queue length
  double? L_queue;

  // Requests quantity
  double? L_mss;

  // Pending time
  double? T;

  // P[i] state probability
  double? P_zero;
  List<double> P_is_inf = [];
  List<double> P_is = [];

  // TODO ENUM needed


  void calculate(){
    // TODO calculate params

    isCalculated = true;
    notifyListeners();
  }

}