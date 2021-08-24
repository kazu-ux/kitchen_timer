import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  final String testStr;
  TimerPage({Key? key, required this.testStr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          testStr,
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
