import 'dart:async';

import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_example/automated_testing_framework_example.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  App({
    Key key,
    @required this.options,
  })  : assert(options != null),
        super(key: key);

  final TestExampleOptions options;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final List<StreamSubscription> _subscriptions = [];
  bool _darkTheme = true;
  TestController _testController;
  StreamController<void> _themeController = StreamController<void>.broadcast();

  Key _uniqueKey = UniqueKey();

  @override
  void initState() {
    super.initState();

    _testController = TestController(
      navigatorKey: _navigatorKey,
      onReset: () async {
        while (_navigatorKey.currentState.canPop()) {
          _navigatorKey.currentState.pop();
        }

        _uniqueKey = UniqueKey();
        setState(() {});
      },
      registry: TestStepRegistry.instance,
      testReader: widget.options.testReader,
      testReporter: widget.options.testReporter,
      testWriter: widget.options.testWriter,
    );

    _themeController.stream.listen((_) {
      _darkTheme = _darkTheme != true;
      if (mounted == true) {
        setState(() {});
      }
    });

    if (widget.options.autorun == true) {
      _runTests();
    }
  }

  @override
  void dispose() {
    _subscriptions.forEach((sub) => sub.cancel());
    _subscriptions.clear();
    _testController?.dispose();
    _testController = null;
    _themeController?.close();
    _themeController = null;

    super.dispose();
  }

  Future<void> _runTests() async {
    var tests = await _testController.loadTests(context);
    await _testController.runPendingTests(tests);
  }

  @override
  Widget build(BuildContext context) {
    return TestRunner(
      controller: _testController,
      enabled: widget.options.enabled,
      progressBuilder: TestProgressBuilder(
        theme: _darkTheme
            ? TestRunnerThemeData.dark(
                showStepText: true,
                showRunnerStatus: !kReleaseMode,
                statusAlignment: TestStatusAlignment.bottomSafe,
              )
            : TestRunnerThemeData(
                showRunnerStatus: !kReleaseMode,
              ),
      ),
      testableRenderController: TestableRenderController(
        flashCount: _darkTheme ? 3 : 0,
        gestures: widget.options.gestures,
        testWidgetsEnabled: widget.options.testWidgetsEnabled,
      ),
      child: MultiProvider(
        providers: [
          Provider<StreamController<void>>.value(value: _themeController),
        ],
        child: MaterialApp(
          key: _uniqueKey,
          navigatorKey: _navigatorKey,
          theme: _darkTheme == true
              ? ThemeData(
                  brightness: Brightness.dark,
                  buttonColor: Colors.indigo.shade700,
                  canvasColor: Color(0xff404040),
                  iconTheme: IconThemeData(color: Colors.lightBlue.shade200),
                  errorColor: Colors.red.shade300,
                  scaffoldBackgroundColor: Color(0xff303030),
                  primarySwatch: Colors.blue,
                )
              : ThemeData(
                  brightness: Brightness.light,
                  buttonTheme: ButtonThemeData(
                    buttonColor: Colors.indigo.shade700,
                    textTheme: ButtonTextTheme.primary,
                  ),
                  canvasColor: Color(0xffe0e0e0),
                  iconTheme: IconThemeData(color: Colors.blue),
                  errorColor: Colors.red,
                  scaffoldBackgroundColor: Color(0xffd0d0d0),
                  primarySwatch: Colors.blue,
                ),
          home: HomePage(),
        ),
      ),
    );
  }
}
