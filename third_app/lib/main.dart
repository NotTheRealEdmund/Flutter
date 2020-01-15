import 'package:flutter/material.dart';

import './home.dart';
import './product.dart';
import './cart.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.red),
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/product': (BuildContext context) => Product(),
        '/cart': (BuildContext context) => Cart(),
      },
    );
  }
}
