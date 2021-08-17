import 'package:flutter/cupertino.dart';

class KitchenTimerModel extends ChangeNotifier {
  var now = '00:00:00';
  void testFunc() {
    now = DateTime.now().toString();
    notifyListeners();
  }

  Widget getSelectedScreen() {
    return Column(
      children: [
        Text(
          '$now',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          '$now',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
