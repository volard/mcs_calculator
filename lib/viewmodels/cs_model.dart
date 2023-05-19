import 'package:flutter/foundation.dart';
import 'package:mcs_calculator/viewmodels/cs_param.dart';
import '../pages/modal_pages/input_stream_intensity.dart';

class ComputingSystemModel extends ChangeNotifier{
  ComputingSystemModel(); // TODO initialize params
  // TODO declare model's params
  bool isCalculated = false;

  ComputingSystemParameter inputStreamIntensity = ComputingSystemParameter(
      name: "asht",
      details: inputStreamIntensityPage
  );



  void calculate(){
    // TODO calculate params

    isCalculated = true;
    notifyListeners();
  }

}