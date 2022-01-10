import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class DatabaseHelper {

  static final String dbName = "db_todo.sqlite";

  static Future<Database> databaseAccess() async{

    String databasePath = join(await getDatabasesPath(), dbName);

    if(await databaseExists(databasePath)){
      print("db already exist");

    }else{
      ByteData data = await rootBundle.load("database/$dbName");

      List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

      await File(databasePath).writeAsBytes(bytes, flush: true);

      print("db is copied");
    }

    return openDatabase(databasePath);
  }
}