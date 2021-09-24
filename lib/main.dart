import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kitchen_timer/db/db.dart';
import 'package:kitchen_timer/model/time_display_model.dart';
import 'package:kitchen_timer/model/timer_model.dart';
import 'package:kitchen_timer/ui/main_page.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    setWindowTitle('ドラえもん');
    setWindowFrame(const Rect.fromLTWH(10, 100, 1000, 2000));
  }
  runApp(const MyApp());
}

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
