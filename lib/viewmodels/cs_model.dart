import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

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

  final Parser _mathExpressionParser = Parser();
  final Variable _rho = Variable('rho');
  final Variable _iVar = Variable('i');
  final Variable m = Variable('m');

  ///
  bool calculate() {
    if (!isReadyToCalculate()) {
      notifyListeners();
      return false;
    }

    // TODO calculate params

    // ---------- loadFactor calculation
    loadFactor = inputStreamIntensity! / (serviceTime! * pendingCapacity!);


    // ---------- pZero calculation
    // TODO maybe extract it to separate function
    Expression sigmaExp = _mathExpressionParser.parse("(pho^i) / (i!)");

    ContextModel mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!));

    double sigmaResult = 0;

    for(int i = 0; i <= _channelsQuantity!; i++){
      mathContext.bindVariable(_iVar, Number(i));
      sigmaResult += sigmaExp.evaluate(EvaluationType.REAL, mathContext);
    }




    // (3) Evaluate expression:
    double eval = sigmaExp.evaluate(EvaluationType.REAL, mathContext);

    print(eval);

    isCalculated = true;
    notifyListeners();
    return true;
  }
}
