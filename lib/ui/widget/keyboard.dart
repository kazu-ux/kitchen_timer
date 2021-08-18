import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/kitchen_timer_model.dart';
import 'package:provider/provider.dart';

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kitchenTimerModel = Provider.of<KitchenTimerModel>(context);
    final List<List<String>> numberKeys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['0']
    ];

    List<TextButton> convertTextIntoTextButton(List<String> list) => list
        .map((str) => TextButton(
              onPressed: () {
                kitchenTimerModel.testFunc(str);
              },
              child: Text(str, style: TextStyle(fontSize: 100)),
            ))
        .toList();

    final List<List<TextButton>> textButtonList =
        numberKeys.map((list) => convertTextIntoTextButton(list)).toList();

    final List<Row> rowList = textButtonList
        .map((list) => Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: list))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rowList,
    );
  }
}
