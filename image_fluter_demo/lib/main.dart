import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Demo'),
      ),
      body: Center(
        // child: Image(
        // image: NetworkImage(
        // 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/f/f2/Iron_Man_Armor_-_Mark_LXXXV.png'),
        // image: AssetImage('assets/Foods.png'),
        // ),
        // child: Image.asset('assets/Foods.png'),
        child: Image.network(
            'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/f/f2/Iron_Man_Armor_-_Mark_LXXXV.png'),
      ),
    );
  }
}
