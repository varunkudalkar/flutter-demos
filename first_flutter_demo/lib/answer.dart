import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String buttonText;
  final Function selectHandler;

  Answer(this.buttonText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container (
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(buttonText),
        onPressed: selectHandler,
      ),
    );
  }

}