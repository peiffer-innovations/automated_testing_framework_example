import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AccessibilityPage extends StatefulWidget {
  AccessibilityPage({Key? key}) : super(key: key);

  @override
  _AccessibilityPageState createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends State<AccessibilityPage> {
  static final Logger _logger = Logger('_AccessibilityPageState');
  final TextEditingController _textController = TextEditingController();
  final _values = <String, dynamic>{
    'enabled_checkbox_2': true,
  };

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'enabled_elevated_button',
                    child: ElevatedButton(
                      onPressed: () {
                        _logger.info('enabled_elevated_button');
                      },
                      child: const Text('Enabled Button'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'disabled_elevated_button',
                    child: const ElevatedButton(
                      onPressed: null,
                      child: Text('Disabled Button'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'enabled_text_button',
                    child: TextButton(
                      onPressed: () {
                        _logger.info('enabled_text_button');
                      },
                      child: const Text('Enabled Button'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'disabled_text_button',
                    child: const ElevatedButton(
                      onPressed: null,
                      child: Text('Disabled Button'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'unselectable_test',
                    child: const Text('Unselectable Text'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'selectable_text',
                    child: const SelectableText('Selectable Text'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'enabled_checkbox_1',
                    child: MergeSemantics(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            onChanged: (value) => setState(
                              () => _values['enabled_checkbox_1'] = value,
                            ),
                            value: _values['enabled_checkbox_1'] == true,
                          ),
                          const SizedBox(width: 16.0),
                          const Text('Enabled Checkbox 1'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'enabled_checkbox_2',
                    child: MergeSemantics(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            onChanged: (value) => setState(
                              () => _values['enabled_checkbox_2'] = value,
                            ),
                            value: _values['enabled_checkbox_2'] == true,
                          ),
                          const SizedBox(width: 16.0),
                          const Text('Enabled Checkbox 2'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'disabled_checkbox_1',
                    child: MergeSemantics(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            onChanged: (value) => null,
                            value: true,
                          ),
                          const SizedBox(width: 16.0),
                          const Text('Disabled Checkbox 1'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'disabled_checkbox_2',
                    child: MergeSemantics(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Checkbox(
                            onChanged: null,
                            value: false,
                          ),
                          const SizedBox(width: 16.0),
                          const Text('Disabled Checkbox 2'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Testable(
              id: 'text_form_field',
              child: MergeSemantics(
                child: TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(labelText: 'Text Field'),
                  initialValue: _values['text_form_field'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
