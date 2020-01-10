import 'package:flutter/material.dart';

import './scrolling_list.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Color _mycolor = Colors.blue[100];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('Scrolling List')),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Change list color'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Light Blue'),
                  onTap: () {
                    setState(() {
                      _mycolor = Colors.blue[100];
                    });
                  },
                ),
                ListTile(
                  title: Text('Light Green'),
                  onTap: () {
                    setState(() {
                      _mycolor = Colors.green[100];
                    });
                  },
                ),
                ListTile(
                  title: Text('Pink'),
                  onTap: () {
                    setState(() {
                      _mycolor = Colors.pink[100];
                    });
                  },
                ),
              ],
            ),
          ),
          body: ScrollingList(_mycolor),
        ));
  }
}
