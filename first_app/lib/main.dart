import 'package:flutter/material.dart';

import './gallery_manager.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anime Gallery'),
        ),
        body: GalleryManager('Anime Image 1'),
      ),
    );
  }
}
