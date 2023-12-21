import 'package:flutter/material.dart';
import 'package:perfin/core/util/style_guide.dart';

class PrimaryButton extends StatelessWidget {
  String title;
  Color? color;
  Function onPressed;
  IconData? iconData;

  PrimaryButton(
      {this.title = '', this.color, required this.onPressed, this.iconData});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(4.0),
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? primaryColor,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
      ),
      onPressed: () {
        onPressed();
      },
      // splashColor: Colors.deepOrange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
              visible: iconData != null,
              child: Icon(
                iconData,
                color: Colors.white,
              )),
          Visibility(
              visible: iconData != null,
              child: const SizedBox(
                width: 10,
              )),
          Text(
            title,
            style: btnTextWhite,
          ),
        ],
      ),
    );
  }
}

class PrimaryFlatBtn extends StatelessWidget {
  String title;
  Color? color;
  Function onPressed;
  IconData? iconData;
  Color foregroundColor;

  PrimaryFlatBtn(
      {this.title = '',
      this.color,
      required this.onPressed,
      this.iconData,
      this.foregroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? primaryColor,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
      ),
      onPressed: () {
        onPressed();
      },
      child: Container(
        height: 40,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Visibility(
              visible: iconData != null,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  iconData,
                  color: foregroundColor,
                ),
              )),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: foregroundColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ]),
      ),
    );
  }
}

class PrimaryOutlinedButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  Color? color;

  PrimaryOutlinedButton(
      {required this.icon, required this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(
          color: color ?? Colors.red, // Border color
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: icon != null,
                  child: Icon(
                    icon,
                    color: color ?? Colors.red, // Border color
                  )),
              Visibility(
                  visible: icon != null,
                  child: const SizedBox(
                    width: 10,
                  )),
              Text(
                title,
                style: btnTextWhite.copyWith(
                  color: color ?? Colors.red,
                ),
              ),
            ]),
      ),
    );
  }
}
