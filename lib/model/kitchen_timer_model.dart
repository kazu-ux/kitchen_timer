import 'package:flutter/cupertino.dart';

class KitchenTimerModel extends ChangeNotifier {
  List<int> inputedNumber = [];
  String padNumber = '';
  String hours = '';
  String minutes = '';
  String seconds = '';
  String time = '00h 00m 00s';

  String convertListNumberToText(List<int> inputedNumber) {
    var numberStr = '';
    inputedNumber.forEach((element) {
      numberStr += element.toString();
    });
    padNumber = numberStr.padLeft(6, '0');
    hours = padNumber.substring(0, 2);
    minutes = padNumber.substring(2, 4);
    seconds = padNumber.substring(4, 6);
    return time = '${hours}h ${minutes}m ${seconds}s';
  }

  dynamic addNumberToList(String str) {
    if (inputedNumber.length >= 6) {
      return;
    }
    inputedNumber.add(int.parse(str));
    convertListNumberToText(inputedNumber);
    notifyListeners();
  }

  void backspace() {
    if (inputedNumber.isEmpty) {
      return;
    }
    inputedNumber.removeLast();
    convertListNumberToText(inputedNumber);
    notifyListeners();
  }
}
