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
        title: Text('Accessibility'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'enabled_elevated_button',
                    child: ElevatedButton(
                      onPressed: () {
                        _logger.info('enabled_elevated_button');
                      },
                      child: Text('Enabled Button'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'disabled_elevated_button',
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Disabled Button'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'enabled_text_button',
                    child: TextButton(
                      onPressed: () {
                        _logger.info('enabled_text_button');
                      },
                      child: Text('Enabled Button'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'disabled_text_button',
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Disabled Button'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'unselectable_test',
                    child: Text('Unselectable Text'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'selectable_text',
                    child: SelectableText('Selectable Text'),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
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
                          SizedBox(width: 16.0),
                          Text('Enabled Checkbox 1'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
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
                          SizedBox(width: 16.0),
                          Text('Enabled Checkbox 2'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
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
                          SizedBox(width: 16.0),
                          Text('Disabled Checkbox 1'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Testable(
                    id: 'disabled_checkbox_2',
                    child: MergeSemantics(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            onChanged: null,
                            value: false,
                          ),
                          SizedBox(width: 16.0),
                          Text('Disabled Checkbox 2'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Testable(
              id: 'text_form_field',
              child: MergeSemantics(
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(labelText: 'Text Field'),
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
