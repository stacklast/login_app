import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'services/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await DBHelper().estaLogueado();
  runApp(MyApp(isLoggedIn: isLoggedIn));
  printDatabasePath();
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Proyecto Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: isLoggedIn ? HomeScreen() : LoginScreen(),
    );
  }
}

void printDatabasePath() async {
  final dbPath = await getDatabasesPath();
  String path = join(dbPath, 'session.db');
  print('Database path: $path');
}