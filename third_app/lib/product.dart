import 'package:flutter/material.dart';

import './item.dart';
import './custom_dialog.dart';

class Product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductState();
  }
}

class _ProductState extends State<Product> {
  List<Item> itemList = <Item>[
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

  void addToCart() {
    // Do nothing yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products Page'),
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (Route<dynamic> route) => false);
                },
              ),
              ListTile(
                title: Text('Products'),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/product', (Route<dynamic> route) => false);
                },
              ),
              ListTile(
                title: Text('My Cart'),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/cart', (Route<dynamic> route) => false);
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
                  'Featured products',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: itemList.length,
                itemBuilder: (context, i) => SizedBox(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (_) => CustomDialog(
                              'Are you sure you wish to add this product to cart?',
                              'This product is ' +
                                  itemList[i].name +
                                  ' which costs \$' +
                                  itemList[i].price,
                              addToCart,
                              'Add to cart'));
                    });
                  },
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(8.0),
                    child: Image.asset(
                      itemList[i].image,
                      fit: BoxFit.cover,
                    ),
                  )
                )),
              ),
            ),
          ],
        ));
  }
}
