import 'dart:async';

import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_example/automated_testing_framework_example.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  App({
    Key? key,
    required this.options,
  }) : super(key: key);

  final TestExampleOptions options;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final List<StreamSubscription> _subscriptions = [];
  bool _darkTheme = true;
  late TestController _testController;
  StreamController<void>? _themeController = StreamController<void>.broadcast();

  Key _uniqueKey = UniqueKey();

  @override
  void initState() {
    super.initState();

    _testController = TestController(
      goldenImageWriter: widget.options.goldenImageWriter,
      navigatorKey: _navigatorKey,
      registry: TestStepRegistry.instance,
      testImageReader: widget.options.testImageReader,
      testReader: widget.options.testReader,
      testReporter: widget.options.testReporter,
      testWriter: widget.options.testWriter,
      variables: widget.options.variables,
    );

    _subscriptions.add(_testController.resetStream.listen((_) {
      while (_navigatorKey.currentState?.canPop() == true) {
        _navigatorKey.currentState?.pop();
      }

      _uniqueKey = UniqueKey();
      setState(() {});
    }));

    if (_themeController != null) {
      _subscriptions.add(_themeController!.stream.listen((_) {
        _darkTheme = _darkTheme != true;
        if (mounted == true) {
          setState(() {});
        }
      }));
    }

    _initialize();
  }

  Future<void> _initialize() async {
    if (widget.options.onInitComplete != null) {
      await widget.options.onInitComplete!(_testController);
    }

    if (widget.options.autorun == true) {
      await _runTests();
    }
  }

  @override
  void dispose() {
    _subscriptions.forEach((sub) => sub.cancel());
    _subscriptions.clear();
    _testController.dispose();
    _themeController?.close();
    _themeController = null;

    super.dispose();
  }

  Future<void> _runTests() async {
    final tests = await _testController.loadTests(
      context,
      suiteName: widget.options.suiteName,
    );
    await _testController.runPendingTests(tests!);
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
            : const TestRunnerThemeData(
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
          Provider<StreamController<void>>.value(value: _themeController!),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          key: _uniqueKey,
          navigatorKey: _navigatorKey,
          theme: _darkTheme == true
              ? ThemeData(
                  brightness: Brightness.dark,
                  buttonTheme: ButtonThemeData(
                    buttonColor: Colors.indigo.shade700,
                  ),
                  canvasColor: const Color(0xff404040),
                  colorScheme: const ColorScheme.dark(error: Colors.red),
                  iconTheme: IconThemeData(color: Colors.lightBlue.shade200),
                  scaffoldBackgroundColor: const Color(0xff303030),
                  primarySwatch: Colors.blue,
                )
              : ThemeData(
                  brightness: Brightness.light,
                  buttonTheme: ButtonThemeData(
                    buttonColor: Colors.indigo.shade700,
                    textTheme: ButtonTextTheme.primary,
                  ),
                  canvasColor: const Color(0xffe0e0e0),
                  colorScheme: const ColorScheme.dark(error: Colors.red),
                  iconTheme: const IconThemeData(color: Colors.blue),
                  scaffoldBackgroundColor: const Color(0xffd0d0d0),
                  primarySwatch: Colors.blue,
                ),
          home: HomePage(
            pages: widget.options.pages,
            title: widget.options.appTitle,
          ),
        ),
      ),
    );
  }
}
