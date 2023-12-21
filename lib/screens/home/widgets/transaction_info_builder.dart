import 'package:flutter/material.dart';
import 'package:perfin/core/util/style_guide.dart';

class TransactionInfoBuilder extends StatelessWidget {
  Color? color;
  String? title;
  String? detail;
  bool? isHighlighted;
  TransactionInfoBuilder(
      {this.color, this.title, this.detail, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: (color ?? primaryColor).withOpacity(0.15),
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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$title',
                      style: isHighlighted!
                          ? body1.copyWith(
                              fontWeight: FontWeight.w800, color: Colors.black)
                          : body1.copyWith(fontSize: 14.5),
                    ),
                    Text(
                      "$detail",
                      style: isHighlighted!
                          ? body1.copyWith(
                              fontWeight: FontWeight.w800, color: Colors.black)
                          : body1.copyWith(fontSize: 14.5),
                    )
                  ],
                ),
              )),
        ));
  }
}
