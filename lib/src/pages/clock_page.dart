import 'dart:async';

import 'package:automated_testing_framework/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  ClockPage({
    Key? key,
  }) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted == true) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('yyyy-MM-dd');
    var timeFormat = DateFormat('HH:mm:ss.SSS');
    var now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text('Clock'),
      ),
      body: SafeArea(
        child: Center(
          child: Testable(
            id: 'column',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  width: 200.0,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Testable(
                  id: 'date',
                  child: Text(dateFormat.format(now)),
                ),
                Testable(
                  id: 'time',
                  child: Text(timeFormat.format(now)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
