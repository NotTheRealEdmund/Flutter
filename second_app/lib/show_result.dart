import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  final String result;
  final String instruction;
  final VoidCallback callback;
  final String actionText;

  ShowResult(this.result, this.instruction, this.callback,
      [this.actionText = "Reset"]);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text(result),
      content: Text(instruction),
      actions: <Widget>[
        FlatButton(
          onPressed: callback,
          color: Colors.white,
          child: Text(actionText),
        )
      ],
    );
  }
}
