import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
class TestExampleOptions {
  TestExampleOptions({
    this.appTitle = 'Automated Tests',
    this.autorun = false,
    this.enabled = !kReleaseMode,
    this.gestures,
    this.goldenImageWriter = TestStore.goldenImageWriter,
    this.onInitComplete,
    this.suiteName,
    this.testImageReader = TestStore.testImageReader,
    this.testReader = TestStore.testReader,
    this.testReporter = TestStore.testReporter,
    this.testWidgetsEnabled = !kReleaseMode,
    this.testWriter = TestStore.testWriter,
    this.variables = const <String, dynamic>{},
  });

  final String appTitle;
  final bool autorun;
  final bool enabled;
  final TestableGestures gestures;
  final GoldenImageWriter goldenImageWriter;
  final Future<void> Function(TestController testController) onInitComplete;
  final String suiteName;
  final TestImageReader testImageReader;
  final TestReader testReader;
  final TestReporter testReporter;
  final bool testWidgetsEnabled;
  final TestWriter testWriter;
  final Map<String, dynamic> variables;
}
