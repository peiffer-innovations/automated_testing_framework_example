import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/material.dart';

class Issue5Page extends StatefulWidget {
  Issue5Page({Key? key}) : super(key: key);

  @override
  _Issue5PageState createState() => _Issue5PageState();
}

class _Issue5PageState extends State<Issue5Page> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue #5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Testable(
              id: 'text_value',
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Testable(
        id: 'fab',
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
