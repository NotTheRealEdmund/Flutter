import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
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
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                title: Text('Products'),
                onTap: () {
                  Navigator.pushNamed(context, '/product');
                },
              ),
              ListTile(
                title: Text('My Cart'),
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ],
          ),
        ),
        body: Text('This is the My Cart page'));
  }
}
