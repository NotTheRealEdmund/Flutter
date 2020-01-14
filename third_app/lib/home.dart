import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Account info'),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              ListTile(
                  title: Text('Home'),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                  },
                ),
                ListTile(
                  title: Text('Products'),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/product', (Route<dynamic> route) => false);
                  },
                ),
                ListTile(
                  title: Text('My Cart'),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/cart', (Route<dynamic> route) => false);
                  },
                ),
            ],
          ),
        ),
        body: Text('This is the home page'));
  }
}
