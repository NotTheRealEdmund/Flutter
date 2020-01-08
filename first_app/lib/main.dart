import 'package:flutter/material.dart';

void main(List<String> args) =>  runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimeList'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {

                },
                child: Text('Add an image'),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/anime.jpg'),
                  Text('Anime Image 1')
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/anime2.jpg'),
                  Text('Anime Image 2')
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}