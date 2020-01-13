import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './button.dart';
import './show_result.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Button> buttonList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    buttonList = initialise();
    super.initState();
  }

  List<Button> initialise() {
    player1 = List();
    player2 = List();
    activePlayer = 1;

    var buttons = <Button>[
      Button(id: 0),
      Button(id: 1),
      Button(id: 2),
      Button(id: 3),
      Button(id: 4),
      Button(id: 5),
      Button(id: 6),
      Button(id: 7),
      Button(id: 8),
    ];
    return buttons;
  }

  void makeMove(Button button) {
    setState(() {
      if (activePlayer == 1) {
        button.text = 'X';
        button.bg = Colors.blue;
        activePlayer = 2;
        player1.add(button.id);
      } else {
        button.text = 'O';
        button.bg = Colors.grey;
        activePlayer = 1;
        player2.add(button.id);
      }
      button.marked = true;
      if (checkWinner() == -1) {
        // No winner yet, game continues
      }
    });
  }

  int checkWinner() {
    var winner = -1;
    if ((player1.contains(0) && player1.contains(1) && player1.contains(2)) ||
        (player1.contains(3) && player1.contains(4) && player1.contains(5)) ||
        (player1.contains(6) && player1.contains(7) && player1.contains(8)) ||
        (player1.contains(0) && player1.contains(3) && player1.contains(6)) ||
        (player1.contains(1) && player1.contains(4) && player1.contains(7)) ||
        (player1.contains(2) && player1.contains(5) && player1.contains(8)) ||
        (player1.contains(0) && player1.contains(4) && player1.contains(8)) ||
        (player1.contains(2) && player1.contains(4) && player1.contains(6))) {
      winner = 1;
    }
    if ((player2.contains(0) && player2.contains(1) && player2.contains(2)) ||
        (player2.contains(3) && player2.contains(4) && player2.contains(5)) ||
        (player2.contains(6) && player2.contains(7) && player2.contains(8)) ||
        (player2.contains(0) && player2.contains(3) && player2.contains(6)) ||
        (player2.contains(1) && player2.contains(4) && player2.contains(7)) ||
        (player2.contains(2) && player2.contains(5) && player2.contains(8)) ||
        (player2.contains(0) && player2.contains(4) && player2.contains(8)) ||
        (player2.contains(2) && player2.contains(4) && player2.contains(6))) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => ShowResult("Player 1 Won!",
                "Press the reset button to start again.", reset));
      } else {
        showDialog(
            context: context,
            builder: (_) => ShowResult("Player 2 Won!",
                "Press the reset button to start again.", reset));
      }
    } else if (player1.length + player2.length == buttonList.length) {
      showDialog(
          context: context,
          builder: (_) => ShowResult(
              "It's a draw!", "Press the reset button to start again.", reset));
    }
    return winner;
  }

  void reset() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = initialise();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tic-Tac-Toe'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 9.0),
              itemCount: buttonList.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    if (buttonList[i].marked == false) {
                      makeMove(buttonList[i]);
                    }
                  },
                  child: Text(
                    buttonList[i].text,
                    style: GoogleFonts.sniglet(
                        color: Colors.white, fontSize: 80.0),
                  ),
                  color: buttonList[i].bg,
                  disabledColor: buttonList[i].bg,
                ),
              ),
            )),
            RaisedButton(
              child: Text('Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0),
                  ),
                  color: Colors.red,
                  padding: const EdgeInsets.all(20.0),
                  onPressed: reset,
            )
          ],
        ));
  }
}
