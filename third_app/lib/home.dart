import 'package:flutter/material.dart';

import './item.dart';
import './product_card.dart';

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
        body: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Hot items!' ,style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.red)),
                  ),
                ),
              ],
            ),
            ProductCard(
              item: Item(name: 'Chino figurine', price: '68.00', image: 'figurine_chino.jpg'),
            ),
            ProductCard(
              item: Item(name: 'Cocoa figurine', price: '69.00', image: 'figurine_cocoa.jpg'),
            ),
            ProductCard(
              item: Item(name: 'Rize figurine', price: '70.00', image: 'figurine_rize.jpg'),
            ),
            ProductCard(
              item: Item(name: 'Syaro figurine', price: '71.00', image: 'figurine_syaro.jpg'),
            ),
          ],
        ),
    );
  }
}
