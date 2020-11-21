import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:third_flutter_app/term.dart';

class TermDetailsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermDetailsPage');
  TermDetailsPage({Key key, this.term}) : super(key: key);
  final Term term;

  Widget termDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.orange[50],
          elevation: 10,
          margin: EdgeInsets.only(bottom: 30),
          child: Html(data: term.htmlDefinition),
        ),
        Row(
          children: [
            Icon(Icons.thumb_up),
            Text('   ${term.likes}'),
            Spacer(),
            Icon(Icons.thumb_down),
            Text('   ${term.dislikes}'),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(term.word),
      ),
      body: SafeArea(minimum: EdgeInsets.all(16.0), child: termDetails()),
    );
  }
}
