import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          Testable(
            id: 'close_dialog_button',
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('CLOSE'),
            ),
          ),
        ],
        content: TestableTextFormField(
          id: 'dialog_text',
          gestures: TestableGestures(
            widgetDoubleTap: TestableGestureAction.toggle_global_overlay,
          ),
          decoration: InputDecoration(),
        ),
        title: Text('Dialog'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialogs')),
      body: Center(
        child: Testable(
          id: 'show_dialog_button',
          child: ElevatedButton(
            onPressed: () => _showDialog(context),
            child: Text('Show Dialog'),
          ),
        ),
      ),
    );
  }
}
