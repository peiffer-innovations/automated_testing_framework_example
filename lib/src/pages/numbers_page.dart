import 'package:automated_testing_framework/widgets.dart';
import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Numbers'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                for (var i = 0; i < 50; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Testable(
                      id: 'numbers_$i',
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        elevation: 2.0,
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text('Number: $i'),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
