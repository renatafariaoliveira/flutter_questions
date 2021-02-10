import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  LineSeparator({this.keyElement});

  final String keyElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyElement),
      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth = 2.0;
          final dashHeight = 1.0;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFF9199C3)),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}
