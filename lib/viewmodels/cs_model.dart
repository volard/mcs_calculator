import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// Singleton considered
class ComputingSystemModel extends ChangeNotifier{
  ComputingSystemModel();


  bool isCalculated = false;
  bool isReadyToCalculate() => (inputStreamIntensity != null) && (serviceTime != null) &&
  (pendingCapacity != null) && (channelsQuantity != null);


  // ---------- INPUT
  // Input stream intensity
  double? inputStreamIntensity;

  // Service time
  double serviceTime = 1;

  // Pending capacity
  double? pendingCapacity;

  // Channels quantity
  double? channelsQuantity;


  // ---------- OUTPUT
  // Load factor
  double? loadFactor;

  // Queue length
  double? queueLength;

  // Requests quantity
  double? requestsQuantity;

  // Pending time
  double? pendingTime;

  // P[0] state probability
  double? pZero;

  // P[i] states probabilities with infinity requests quantity consideration
  List<double> pIsInf = [];

  // P[i] states probabilities
  List<double> pIs = [];


  void calculate(){
    // TODO calculate params

    isCalculated = true;
    notifyListeners();
  }

}