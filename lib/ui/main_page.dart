import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/kitchen_timer_model.dart';
import 'package:kitchen_timer/ui/widget/keyboard.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kitchenTimerModel1 =
        context.select((KitchenTimerModel foo) => foo.getSelectedScreen());
    final kitchenTimerModel2 =
        context.select((KitchenTimerModel value) => value.testFunc());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('キッチンタイマー'),
      ),
      body: Keyboard(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<KitchenTimerModel>().testFunc();
        },
      ),
    );
  }
}
