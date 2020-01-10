import 'package:flutter/material.dart';

class ScrollingList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollingListState();
  }
}

class _ScrollingListState extends State<ScrollingList> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              color: Colors.lightBlue,
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        )));
  }
}
