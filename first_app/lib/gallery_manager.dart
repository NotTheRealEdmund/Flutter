import 'package:flutter/material.dart';

import './gallery.dart';

class GalleryManager extends StatefulWidget {
  final String startingName;

  GalleryManager(this.startingName);

  @override
  State<StatefulWidget> createState() {
    return _GalleryManagerState();
  }
}

class _GalleryManagerState extends State<GalleryManager> {
  List<String> _gallery = [];

  @override
  void initState() {
    _gallery.add(widget.startingName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
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
