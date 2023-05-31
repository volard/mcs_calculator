import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// Singleton considered
class ComputingSystemModel extends ChangeNotifier {
  ComputingSystemModel();

  bool isCalculated = false;
  bool isModified = false;

  bool isReadyToCalculate() =>
      (inputStreamIntensity != null) &&
      (serviceTime != null) &&
      (pendingCapacity != null) &&
      (channelsQuantity != null);

  // ---------- INPUT
  double? _inputStreamIntensity; // lambda
  double? get inputStreamIntensity => _inputStreamIntensity;
  set inputStreamIntensity(double? value) {
    _inputStreamIntensity = value;
    if(isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }

  double? _serviceTime = 1; // mu
  double? get serviceTime => _serviceTime;
  set serviceTime(double? value) {
    _serviceTime = value;
    if(isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }

  double? _pendingCapacity; // m
  double? get pendingCapacity => _pendingCapacity;
  set pendingCapacity(double? value) {
    _pendingCapacity = value;
    if(isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }

  double? _channelsQuantity; // n
  double? get channelsQuantity => _channelsQuantity;
  set channelsQuantity(double? value) {
    _channelsQuantity = value;
    if(isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }

  // ---------- OUTPUT
  double? loadFactor; // rho
  double? queueLength; // L_queue
  double? requestsQuantity; // L_mss
  double? pendingTime; // T

  // P[0] state probability
  double? pZero;

  // P[i] states probabilities
  List<double> pIs = [];

  // P[i] states probabilities with infinity pending capacity consideration
  List<double> pIsInf = [];

  ///
  bool calculate() {
    if (!isReadyToCalculate()) {
      notifyListeners();
      return false;
    }
    // TODO calculate params

    isCalculated = true;
    notifyListeners();
    return true;
  }

  double getLoadFactor(double inputStreamIntensity, double serviceTime, double pendingCapacity){
    return inputStreamIntensity / (serviceTime * pendingCapacity);
  }
}
