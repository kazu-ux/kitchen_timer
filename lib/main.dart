import 'package:flutter/material.dart';
import 'package:kitchen_timer/model/time_display_model.dart';
import 'package:kitchen_timer/model/timer_model.dart';
import 'package:kitchen_timer/ui/main_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimeDisplayModel>(
          create: (context) => TimeDisplayModel(),
        ),
        ChangeNotifierProvider<TimerModel>(
          create: (context) => TimerModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
