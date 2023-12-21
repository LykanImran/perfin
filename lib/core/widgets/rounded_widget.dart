import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perfin/core/util/style_guide.dart';

class RoundedWidget extends StatelessWidget {
  Widget child;
  Color? color;
  RoundedWidget({required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              decoration: BoxDecoration(color: color),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: child,
              )),
        ));
  }
}
