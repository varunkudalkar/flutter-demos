import 'package:flutter/material.dart';

class EnterTermPage extends StatefulWidget {
  static final valueKey = ValueKey('EnterTermPage');

  EnterTermPage({Key key, this.searchForTerm}) : super(key: key);
  final ValueChanged<String> searchForTerm;

  @override
  State<StatefulWidget> createState() => _EnterTermPageState();
}

class _EnterTermPageState extends State<EnterTermPage> {
  final _textFieldController = TextEditingController();

  void _search() {
    widget.searchForTerm(_textFieldController.text);
  }

  Widget searchForm() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter term'),
            ),
            FlatButton(
                onPressed: _search,
                color: Colors.orangeAccent,
                textColor: Colors.white,
                child: Text('Search'))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urban Dictionary'),
      ),
      body: searchForm(),
    );
  }
}
