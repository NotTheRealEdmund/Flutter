import 'package:flutter/material.dart';

import './item.dart';

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
    Item(name: 'Syaro figurine', price: '71.00', image: 'figurine_syaro.jpg')
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
                child: Text(
                  'My Order (' + orderList.length.toString() + ')',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(10.0),
                itemCount: orderList.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: <Widget>[
                      Image.asset(
                          orderList[i].image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      Text(orderList[i].name + ': \$' + orderList[i].price)
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int i) => const Divider(),
              )
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Total: \$' + sum.toStringAsFixed(2),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )
            ),
          ],
        )
    );
  }
}
