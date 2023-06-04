import 'dart:core';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

// Singleton considered
// TODO one model here consists of wo actually:  one with constant pendingCapacity and another with infinity capacity. For the task its ok but...
// TODO And to be honest ideally I have to decompose all equations and find logical relation between "infinity system" and "constant one" but for now my brains literally dead so I have to code super smelling shit only because of fucking deadline and teacher stupidity bruh
class ComputingSystemModel extends ChangeNotifier {
  ComputingSystemModel();

  ComputingSystemModel.predefined(
      this._inputStreamIntensity,
      this._serviceTime,
      this._pendingCapacity,
      this._channelsQuantity
  );

  bool isCalculated = false;
  bool isModified = false;

  bool isReadyToCalculate() =>
      (inputStreamIntensity != null) &&
      (serviceTime != null) &&
      (pendingCapacity != null) &&
      (channelsQuantity != null);

  //#region ---------- INPUT
  double? _inputStreamIntensity; // lambda
  double? get inputStreamIntensity => _inputStreamIntensity;
  set inputStreamIntensity(double? value) {
    _inputStreamIntensity = value;
    if (isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }

  double? _serviceTime = 1; // mu
  double? get serviceTime => _serviceTime;
  set serviceTime(double? value) {
    _serviceTime = value;
    if (isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }

  double? _pendingCapacity; // m
  double? get pendingCapacity => _pendingCapacity;
  set pendingCapacity(double? value) {
    _pendingCapacity = value;
    if (isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }

  double? _channelsQuantity; // n
  double? get channelsQuantity => _channelsQuantity;
  set channelsQuantity(double? value) {
    _channelsQuantity = value;
    if (isCalculated && isReadyToCalculate()) {
      isModified = true;
    } else {
      isModified = false;
    }
  }
  //#endregion

  //#region ---------- OUTPUT
  double? loadFactor; // rho
  double? queueLength; // L_queue
  double? requestsQuantity; // L_mss
  double? pendingTime; // T (or W)
  //#endregion

  //region ---------- REST OF PROPERTIES
  double? pRejection;
  final double pRejectionInf = 0;

  double? relativeThroughput; // Q
  final double relativeThroughputInf = 1; // Q_inf

  double? absoluteThroughput; // A
  double? absoluteThroughputInf; // A_inf

  // P[0] state probability
  double? pZero;
  double? pZeroInf;

  // P[i] states probabilities
  List<double> pIs = [];

  // P[i] states probabilities with infinity pending capacity consideration
  List<double> pIsInf = [];

  List<FlSpot> graphPoints = [];
  List<FlSpot> graphInfPoints = [];
  //#endregion

  final Parser _mathExpressionParser = Parser();
  final Variable _rho = Variable('rho');
  final Variable _iVar = Variable('i');
  final Variable _m = Variable('m');
  final Variable _n = Variable('n');
  final Variable _Pzero = Variable('Pzero');


  /// Calculates local [loadFactor] and returns it
  double calculateLoadFactor(){
    assert(inputStreamIntensity != null, "calculate inputStreamIntensity before");
    assert(serviceTime != null, "calculate serviceTime before");
    assert(pendingCapacity != null, "calculate pendingCapacity before");

    loadFactor = inputStreamIntensity! / serviceTime!;
    return loadFactor!;
  }

  /// Calculates local [pZero] and returns it
  double calculatePZero(){
    assert(loadFactor != null, "calculate loadFactor before");
    assert(channelsQuantity != null, "calculate channelsQuantity before");
    assert(pendingCapacity != null, "calculate pendingCapacity before");

    Expression sigmaExp = _mathExpressionParser.parse(
        "(rho^i) / "
            "(i!)");

    ContextModel mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!));

    double sigmaResult = 0;

    for (int i = 0; i <= _channelsQuantity!; i++) {
      mathContext.bindVariable(_iVar, Number(i));
      sigmaResult += sigmaExp.evaluate(EvaluationType.REAL, mathContext);
    }

    Expression pZeroExpression = _mathExpressionParser.parse("(rho^(n+1)) / "
        "(n! * (n - rho)) * "
        "(1 - (rho / n)^m)");

    mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!))
      ..bindVariable(_n, Number(channelsQuantity!))
      ..bindVariable(_m, Number(_pendingCapacity!));

    pZero = 1 /
        (sigmaResult +
            pZeroExpression.evaluate(EvaluationType.REAL, mathContext));

    return pZero!;
  }

  /// Calculates local [pZeroInf] and returns it
  double calculatePZeroInf(){
    assert(loadFactor != null, "calculate loadFactor before");
    assert(channelsQuantity != null, "calculate channelsQuantity before");

    Expression sigmaExp = _mathExpressionParser.parse(
        "(rho^i) / "
            "(i!)");

    ContextModel mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!));

    double sigmaResult = 0;

    for (int i = 0; i <= _channelsQuantity!; i++) {
      mathContext.bindVariable(_iVar, Number(i));
      sigmaResult += sigmaExp.evaluate(EvaluationType.REAL, mathContext);
    }

    Expression pZeroInfExpression = _mathExpressionParser.parse("(rho^(n+1)) / "
        "(n! * (n - rho))");

    mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!))
      ..bindVariable(_n, Number(channelsQuantity!));

    pZeroInf = 1 /
        (sigmaResult +
            pZeroInfExpression.evaluate(EvaluationType.REAL, mathContext));
    return pZeroInf!;
  }

  /// Calculates local [pRejection] and returns it
  double calculatePRejection(){
    assert(loadFactor != null, "calculate loadFactor before");
    assert(channelsQuantity != null, "calculate channelsQuantity before");
    assert(pendingCapacity != null, "calculate pendingCapacity before");
    assert(pZero != null, "calculate pZero before");

    Expression pRejectionExpression =
    _mathExpressionParser.parse("(rho^(n+m)) / "
        "(n^m * (n + m)!) * "
        "Pzero");

    ContextModel mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!))
      ..bindVariable(_n, Number(channelsQuantity!))
      ..bindVariable(_m, Number(pendingCapacity!))
      ..bindVariable(_Pzero, Number(pZero!));

    pRejection =
        pRejectionExpression.evaluate(EvaluationType.REAL, mathContext);
    return pRejection!;
  }

  /// Calculates local [relativeThroughput] and returns it
  double calculateRelativeThroughput(){
    assert(pRejection != null, "calculate pRejection before");

    relativeThroughput = 1 - pRejection!;
    return relativeThroughput!;
  }

  /// Calculates local [absoluteThroughput] and returns it
  double calculateAbsoluteThroughput(){
    assert(inputStreamIntensity != null, "calculate inputStreamIntensity before");
    assert(relativeThroughput != null, "calculate relativeThroughput before");

    absoluteThroughput = inputStreamIntensity! * relativeThroughput!;

    return absoluteThroughput!;
  }

  /// Calculates local [absoluteThroughputInf] and returns it
  double calculateAbsoluteThroughputInf(){
    assert(inputStreamIntensity != null, "calculate inputStreamIntensity before");

    absoluteThroughputInf = inputStreamIntensity!;

    return absoluteThroughputInf!;
  }

  /// Calculates local [queueLength] and returns it
  double calculateQueueLength(){
    assert(loadFactor != null, "calculate loadFactor before");
    assert(channelsQuantity != null, "calculate channelsQuantity before");
    assert(pendingCapacity != null, "calculate pendingCapacity before");
    assert(pZero != null, "calculate pZero before");

    Expression queueLengthExpression = _mathExpressionParser.parse("Pzero * "
        "(rho^(n+1))/(n! * n) * "
        "( (1 - (rho/n)^m) * (m + 1 - m * (rho / n)) ) / "
        "(1 - rho/n)^2"
    );

    ContextModel mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!))
      ..bindVariable(_n, Number(channelsQuantity!))
      ..bindVariable(_m, Number(pendingCapacity!))
      ..bindVariable(_Pzero, Number(pZero!));

    queueLength = queueLengthExpression.evaluate(EvaluationType.REAL, mathContext);

    return queueLength!;
  }

  /// Calculates local [pendingTime] and returns it
  double calculatePendingTime(){
    assert(queueLength != null, "calculate queueLength before");
    assert(absoluteThroughput != null, "calculate absoluteThroughput before");

    pendingTime = queueLength! / absoluteThroughput!;

    return pendingTime!;
  }

  /// Calculates local [requestsQuantity] and returns it
  double calculateRequestsQuantity(){
    assert(queueLength != null, "calculate queueLength before");
    assert(loadFactor != null, "calculate loadFactor before");
    assert(relativeThroughput != null, "calculate relativeThroughput before");

    requestsQuantity = queueLength! + loadFactor! * relativeThroughput!;

    return requestsQuantity!;
  }

  /// Calculates system's properties and return success status
  /// whether calculation happened or not
  bool calculate() {
    if (!isReadyToCalculate()) {
      notifyListeners();
      return false;
    } else {
      if (!isModified){
        return true;
      }
    }

    calculateLoadFactor(); // rho

    calculatePZero();
    calculateQueueLength(); // L_queue

    calculatePRejection();
    calculateRelativeThroughput();
    calculateRequestsQuantity(); // L_mss
    
    calculateAbsoluteThroughput();
    calculatePendingTime(); // T (or W)

    //#region ---------- pIs calculation

    Expression pIExpression = _mathExpressionParser.parse(
      "(rho^i / i!) * Pzero"
    );

    ContextModel mathContext = ContextModel()
      ..bindVariable(_rho, Number(loadFactor!))
      ..bindVariable(_Pzero, Number(pZero!));

    for(int i = 0; i < _channelsQuantity! + _pendingCapacity!; i++){
      mathContext.bindVariable(_iVar, Number(i));
      pIs.add(pIExpression.evaluate(EvaluationType.REAL, mathContext));
    }

    //#endregion

    //#region ---------- Graphs calculation
    graphPoints.clear();
    graphInfPoints.clear();

    for(double i = 0; i < inputStreamIntensity!; i += 0.2){
      var currentModel = ComputingSystemModel.predefined(
          _inputStreamIntensity,
          _serviceTime,
          _pendingCapacity,
          _channelsQuantity)
      ..calculateLoadFactor()
      ..calculatePZero()
      ..calculatePRejection()
      ..calculateRelativeThroughput()
      ..calculateAbsoluteThroughput()
      ..calculateQueueLength()
      ..calculatePendingTime();
      
      graphPoints.add(FlSpot(currentModel.loadFactor!, currentModel.pendingTime!));

      // TODO I stuck with "infinity system" calculation

    }

    //#endregion

    isCalculated = true;
    notifyListeners();
    return true;
  }
}
