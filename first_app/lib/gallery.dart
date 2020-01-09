import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final List<String> gallery;

  Gallery(this.gallery);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: gallery
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/anime.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
