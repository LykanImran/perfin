import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarHelper {
  loadingFlush(BuildContext context, {String msg = "Saving Transaction "}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      borderRadius: BorderRadius.circular(10),
      message: msg,
      messageSize: 18,
      icon: Icon(
        Icons.donut_large,
        size: 30,
        color: Colors.green,
      ),
      duration: const Duration(seconds: 4),
      leftBarIndicatorColor: Colors.green,
    ).show(context);
  }

  successFlush(BuildContext context,
      {String msg = "Transaction Saved Successfully"}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      borderRadius: BorderRadius.circular(10),
      message: msg,
      messageSize: 18,
      icon: Icon(
        Icons.check_circle_outline_outlined,
        size: 30,
        color: Colors.green,
      ),
      duration: const Duration(seconds: 4),
      leftBarIndicatorColor: Colors.green,
    ).show(context);
  }

  errorFlush(BuildContext context, {String msg = 'Cannot Add Transaction'}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      borderRadius: BorderRadius.circular(10),
      message: msg,
      messageSize: 18,
      icon: Icon(
        Icons.error,
        size: 30,
        color: Colors.red,
      ),
      duration: const Duration(seconds: 4),
      leftBarIndicatorColor: Colors.red,
    ).show(context);
  }
}
