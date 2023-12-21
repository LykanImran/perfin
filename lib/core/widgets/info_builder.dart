import 'package:flutter/material.dart';
import 'package:perfin/core/util/style_guide.dart';

class InfoBuilder extends StatelessWidget {
  String title;
  String info;
  InfoBuilder({this.title = "", this.info = ""});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("${title}",
              textAlign: TextAlign.start,
              style: display2.copyWith(fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "${info}",
            style: display3,
          ),
        ),
      ],
    );
  }
}
