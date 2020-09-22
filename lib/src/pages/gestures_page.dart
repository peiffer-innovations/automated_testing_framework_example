import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/material.dart';

class GesturesPage extends StatefulWidget {
  GesturesPage({
    Key key,
  }) : super(key: key);

  @override
  _GesturesPageState createState() => _GesturesPageState();
}

class _GesturesPageState extends State<GesturesPage> {
  String _value = 'No Action';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestures')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(8.0),
              elevation: 2.0,
              child: Testable(
                // Disable the gestures on this one so the widget itself gets
                // all gestures
                gestures: TestableGestures(),
                id: 'interactive_button',
                child: InkWell(
                  onDoubleTap: () => setState(() => _value = 'Double Tap'),
                  onLongPress: () => setState(() => _value = 'Long Press'),
                  onTap: () => setState(() => _value = 'Tap'),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Hit Me'),
                  ),
                ),
              ),
            ),
            Testable(
              id: 'action_text',
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(_value ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
