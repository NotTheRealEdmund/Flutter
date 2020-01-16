import 'package:flutter/material.dart';

import './item.dart';

class ProductCard extends StatelessWidget {
  final Item item;

  ProductCard({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                this.item.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          RichText(text: TextSpan(
              children: [
                TextSpan(text: this.item.name + '\n', style: TextStyle(fontSize: 20)),
                TextSpan(text: '\$' + this.item.price + '\t', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ], style: TextStyle(color: Colors.black)
          ),)
        ],
      ),
    );
  }
}