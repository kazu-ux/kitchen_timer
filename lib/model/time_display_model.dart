import 'package:flutter/cupertino.dart';

class TimeDisplayModel extends ChangeNotifier {
  List<int> inputedNumber = [0, 0, 0, 0, 0, 0];
  String padNumber = '';
  String hours = '';
  String minutes = '';
  String seconds = '';
  String time = '00h 00m 00s';
  int totalSeconds = 0;

  String convertListNumberToText(List<int> inputedNumber) {
    hours = inputedNumber[0].toString() + inputedNumber[1].toString();
    minutes = inputedNumber[2].toString() + inputedNumber[3].toString();
    seconds = inputedNumber[4].toString() + inputedNumber[5].toString();

    return time = '${hours}h ${minutes}m ${seconds}s';
  }

  void convertIntoSeconds() {
    totalSeconds =
        int.parse(hours) * 3600 + int.parse(minutes) * 60 + int.parse(seconds);
  }

  dynamic addNumberToList(String str) {
    if (inputedNumber.first != 0) {
      return;
    }
    inputedNumber.add(int.parse(str));
    {
      inputedNumber.removeAt(0);
    }
    convertListNumberToText(inputedNumber);
    convertIntoSeconds();
    notifyListeners();
  }

  void backspace() {
    if (inputedNumber.isEmpty) {
      return;
    }
    inputedNumber.removeLast();
    {
      inputedNumber.insert(0, 0);
    }
    convertListNumberToText(inputedNumber);
    convertIntoSeconds();
    notifyListeners();
  }

  void allDelete() {
    inputedNumber = [0, 0, 0, 0, 0, 0];
    convertListNumberToText(inputedNumber);
    convertIntoSeconds();
    notifyListeners();
  }
}
