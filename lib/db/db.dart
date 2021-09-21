import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class Memo {
  final int id;
  final String text;
  final int priority;

  Memo({required this.id, required this.text, required this.priority});
}

void main() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'doggie_datavase.db'),
    onCreate: (db, varsion) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );
}
