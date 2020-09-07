import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
class TestExampleOptions {
  TestExampleOptions({
    this.autorun = false,
    this.enabled = !kReleaseMode,
    this.gestures,
    this.testReader = TestStore.testReader,
    this.testReporter = TestStore.testReporter,
    this.testWidgetsEnabled = !kReleaseMode,
    this.testWriter = TestStore.testWriter,
  });

  final bool autorun;
  final bool enabled;
  final TestableGestures gestures;
  final TestReader testReader;
  final TestReporter testReporter;
  final bool testWidgetsEnabled;
  final TestWriter testWriter;
}
