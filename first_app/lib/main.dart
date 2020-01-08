import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _gallery = ['Anime Image 1'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Anime Gallery'),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _gallery.add(
                          'Anime Image ' + (_gallery.length + 1).toString());
                    });
                  },
                  child: Text('Add an image'),
                ),
              ),
              Column(
                children: _gallery
                    .map((element) => Card(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/anime.jpg'),
                              Text(element)
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],
          )),
    );
  }
}
