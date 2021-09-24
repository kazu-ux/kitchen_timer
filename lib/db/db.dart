import 'dart:async';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

class Memo {
  final testValue = 0;

  void testFunc() async {
    final directory = await getApplicationSupportDirectory();
    // final path = directory.path;
    final currentPath = Directory.current.path;
    // final dbPath = '$currentPath\\myBox';

    // print(dbPath);

    await Hive.initFlutter();
    var box = await Hive.openBox<String>('myBox', path: currentPath);
    await box.close();
  }
}
