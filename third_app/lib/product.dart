import 'package:flutter/material.dart';

import './item.dart';

class Product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductState();
  }
}

class _ProductState extends State<Product> {
  List<Item> itemList = <Item>[
    Item(name: 'Chino figurine', price: '68.00 SGD', image: 'figurine_chino.jpg'),
    Item(name: 'Cocoa figurine', price: '69.00 SGD', image: 'figurine_cocoa.jpg'),
    Item(name: 'Rize figurine', price: '70.00 SGD', image: 'figurine_rize.jpg'),
    Item(name: 'Syaro figurine', price: '71.00 SGD', image: 'figurine_syaro.jpg')
  ];

  List<Item> selected = [];

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
            Expanded(
              flex: 2,
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
                      selected.add(itemList[i]);
                    });
                  },
                  child: Image.asset(
                    itemList[i].image,
                    fit: BoxFit.cover,
                  ),
                )),
              ),
            ),
            Center(
                child: Text('Selected products:\n',
                    style: TextStyle(color: Colors.blue))),
            Expanded(
              child: ListView.builder(
                  itemCount: selected.length,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Text(
                          selected[i].name + ': ' + selected[i].price + '\n'),
                    );
                  }),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: Colors.red,
                    padding: const EdgeInsets.all(20.0),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ))),
            RaisedButton(
                child: Text(
                  'Clear selected items',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Colors.red,
                padding: const EdgeInsets.all(20.0),
                onPressed: () {
                  setState(() {
                    selected.clear();
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ))
          ],
        ));
  }
}