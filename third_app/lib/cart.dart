import 'package:flutter/material.dart';

import './item.dart';
import './product_card.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  List<Item> orderList = <Item>[
    Item(name: 'Chino figurine', price: '68.00', image: 'figurine_chino.jpg'),
    Item(name: 'Cocoa figurine', price: '69.00', image: 'figurine_cocoa.jpg'),
    Item(name: 'Rize figurine', price: '70.00', image: 'figurine_rize.jpg'),
    Item(name: 'Syaro figurine', price: '71.00', image: 'figurine_syaro.jpg'),
    Item(name: 'Anime keychain', price: '5.00', image: 'anime_keychain.jpg'),
    Item(name: 'Ballpoint pen', price: '2.00', image: 'ballpoint_pen.jpg'),
    Item(name: 'Bottle cap', price: '0.50', image: 'bottle_cap.jpg'),
    Item(name: 'Gacha amulet', price: '3.00', image: 'gacha_amulet.jpg'),
    Item(name: 'Nokia phone', price: '30.00', image: 'nokia_phone.jpg'),
    Item(name: 'Puzzle ring', price: '7.00', image: 'puzzle_ring.jpg'),
    Item(name: 'Black ring', price: '20.00', image: 'ring_black.jpg'),
    Item(name: 'Silver ring', price: '20.00', image: 'ring_silver.jpg'),
    Item(name: 'Sharpie marker', price: '4.50', image: 'sharpie_marker.jpg'),
    Item(name: 'Tarot card', price: '1.00', image: 'tarot_card.jpg'),
    Item(name: 'Tennis ball', price: '2.50', image: 'tennis_ball.jpg'),
    Item(name: 'Wire', price: '0.10', image: 'wire.jpg')
  ];

  double sum = 0.0;

  double calculateSum() {
    double tempSum = 0.0;
    for (Item x in orderList) {
      tempSum += double.parse(x.price);
    }
    return tempSum;
  }

  @override
  void initState() {
    sum = calculateSum();
    super.initState();
  }

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
        body: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My Order (' + orderList.length.toString() + ')',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: orderList.map((element) => ProductCard(item: element)).toList()
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Total: \$' + sum.toStringAsFixed(2),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.orange,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Proceed to payment",
                ),
              )
            ),
          ]
        )
    );
  }
}
