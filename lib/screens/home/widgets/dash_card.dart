import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfin/core/util/style_guide.dart';
import 'package:perfin/core/widgets/base_card.dart';

class DashCard extends StatelessWidget {
  String? title;
  String? subtitle;
  Color? color;
  IconData? icon;
  DashCard({this.title, this.subtitle, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FaIcon(
            icon,
            size: 45,
            color: color,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$title",
                style: display1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$subtitle",
                style: display2.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
