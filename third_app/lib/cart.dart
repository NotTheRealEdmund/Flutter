import 'package:flutter/material.dart';

import './item.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  List<Item> orderList = [];

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
                child: Text(
                  'My Order (' + orderList.length.toString() + ')',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
            )
          ],
        )
    );
  }
}
