import 'package:flutter/cupertino.dart';

class KitchenTimerModel extends ChangeNotifier {
  List<int> inputedNumber = [0, 0, 0, 0, 0, 0];
  String padNumber = '';
  String hours = '';
  String minutes = '';
  String seconds = '';
  String time = '00h 00m 00s';

  String convertListNumberToText(List<int> inputedNumber) {
    hours = inputedNumber[inputedNumber.length - 6].toString() +
        inputedNumber[inputedNumber.length - 5].toString();

    minutes = inputedNumber[inputedNumber.length - 4].toString() +
        inputedNumber[inputedNumber.length - 3].toString();

    seconds = inputedNumber[inputedNumber.length - 2].toString() +
        inputedNumber[inputedNumber.length - 1].toString();

    return time = '${hours}h ${minutes}m ${seconds}s';
  }

  dynamic addNumberToList(String str) {
    if (inputedNumber.first != 0) {
      return;
    }
    inputedNumber.add(int.parse(str));
    inputedNumber.removeAt(0);
    print(inputedNumber);
    convertListNumberToText(inputedNumber);
    notifyListeners();
  }

  void backspace() {
    if (inputedNumber.isEmpty) {
      return;
    }
    inputedNumber.removeLast();
    inputedNumber.insert(0, 0);
    print(inputedNumber);
    convertListNumberToText(inputedNumber);
    notifyListeners();
  }
}
