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
              child: const Text('CLOSE'),
            ),
          ),
        ],
        content: TestableTextFormField(
          id: 'dialog_text',
          gestures: TestableGestures(
            widgetDoubleTap: TestableGestureAction.toggle_global_overlay,
          ),
          decoration: const InputDecoration(),
        ),
        title: const Text('Dialog'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogs')),
      body: Center(
        child: Testable(
          id: 'show_dialog_button',
          child: ElevatedButton(
            onPressed: () => _showDialog(context),
            child: const Text('Show Dialog'),
          ),
        ),
      ),
    );
  }
}
