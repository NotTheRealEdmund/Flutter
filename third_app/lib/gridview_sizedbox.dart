import 'package:flutter/material.dart';

import './item.dart';
import './custom_dialog.dart';

class GridviewSizedbox extends StatelessWidget {
  final Item item;

  GridviewSizedbox(this.item);

  void addToCart() {
    // Do nothing yet
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (_) => CustomDialog(
                    'Are you sure you wish to add this product to cart?',
                    'This product is ' +
                        this.item.name +
                        ' which costs \$' +
                        this.item.price,
                    addToCart,
                    'Add to cart'));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              this.item.image,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
