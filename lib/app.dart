import 'package:flutter/material.dart';

import './constants.dart';
import './pages/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laptop4Code',
      theme: ThemeData(
        primaryColor: colorClassicBlue,
        colorScheme: colorSchemeLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
      },
    );
  }
}
