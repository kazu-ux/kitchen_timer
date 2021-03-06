import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/time_display_model.dart';
import 'package:provider/provider.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final timeDisplayModel = context.select((TimeDisplayModel value) => value);
    final numberKeys = <List<String>>[
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['0']
    ];

    List<TextButton> convertTextIntoTextButton(List<String> list) => list
        .map((str) => TextButton(
              onPressed: () {
                timeDisplayModel.addNumberToList(str);
              },
              child: Text(str, style: const TextStyle(fontSize: 100)),
            ))
        .toList();

    final textButtonList = numberKeys.map(convertTextIntoTextButton).toList();

    final rowList = textButtonList
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
