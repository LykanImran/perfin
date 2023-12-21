import 'package:flutter/material.dart';
import 'package:perfin/core/util/style_guide.dart';

class BaseCard extends StatelessWidget {
  Widget child;
  double elevation;
  Color? color;
  BaseCard({required this.child, this.elevation = 15, this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: color ?? primaryColor,
                          style: BorderStyle.solid,
                          width: 4.0))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: child,
              )),
        ));
  }
}
