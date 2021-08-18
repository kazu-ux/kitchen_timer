import 'package:flutter/cupertino.dart';

class KitchenTimerModel extends ChangeNotifier {
  var inputedNumber = '';
  void testFunc(String str) {
    // print(str);
    inputedNumber += str;
    notifyListeners();
  }

  Widget getSelectedScreen() {
    return Column(
      children: [
        Text(
          '$inputedNumber',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          '$inputedNumber',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
