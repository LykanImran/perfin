import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  Widget child;
  Color color;
  BorderWidget({required this.child, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: child,
    );
  }
}
