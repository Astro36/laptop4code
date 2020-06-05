import 'package:flutter/material.dart';

import './pages/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laptop4Code',
      theme: ThemeData(
        primaryColor: Color(0xFF0F4C81),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
      },
    );
  }
}
