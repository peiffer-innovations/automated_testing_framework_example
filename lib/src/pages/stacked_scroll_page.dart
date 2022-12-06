import 'package:automated_testing_framework/widgets.dart';
import 'package:flutter/material.dart';

class StackedScrollPage extends StatelessWidget {
  StackedScrollPage({Key? key}) : super(key: key);

  Widget _buildHorizontalScroll(int index) => Container(
        height: 232.0,
        child: ListView.builder(
          key: ValueKey<String?>('inner_scroll_$index'),
          itemBuilder: (BuildContext context, int idx) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Testable(
              id: 'widget_${index}_$idx',
              child: Material(
                elevation: 2.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      width: 200.0,
                      child: const Placeholder(),
                    ),
                    Text('$index.$idx'),
                  ],
                ),
              ),
            ),
          ),
          itemCount: 100,
          scrollDirection: Axis.horizontal,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stacked Scroll Page'),
      ),
      body: ListView.builder(
        key: const ValueKey('outer_scroll'),
        itemBuilder: (BuildContext context, int index) =>
            _buildHorizontalScroll(index),
        itemCount: 100,
      ),
    );
  }
}
