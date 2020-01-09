import 'package:flutter/material.dart';

import './gallery.dart';

class GalleryManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GalleryManagerState();
  }
}

class _GalleryManagerState extends State<GalleryManager> {
  List<String> _gallery = ['Anime Image 1'];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _gallery.add('Anime Image ' + (_gallery.length + 1).toString());
            });
          },
          child: Text('Add an image'),
        ),
      ),
      Gallery(_gallery)
    ]);
  }
}
