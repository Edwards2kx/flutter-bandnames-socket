import 'package:flutter/material.dart';
import 'package:udemy_avanzado_1/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 1.0,
          color: Colors.transparent,
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black87, fontSize: 30.0),
          ),
        ),
      ),
      initialRoute: 'home',
      routes: {'home': (_) => HomePage()},
    );
  }
}


