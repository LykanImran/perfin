import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionModel {
  String? id;
  double? amount;
  String? note;
  String? type;
  Timestamp? date;

  TransactionModel({this.id, this.amount, this.note, this.type, this.date});

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    return TransactionModel(
      id: doc.id,
      amount: (doc.data() as Map)['amount'].toDouble() ?? 0,
      note: (doc.data() as Map)['note'] ?? '',
      type: (doc.data() as Map)['type'] ?? 'icome',
      date: (doc.data() as Map)['date'] ?? Timestamp.fromDate(DateTime.now()),
    );
  }

  Map<String, dynamic> getMap() {
    date = Timestamp.fromDate(DateTime.now());
    var map = {'amount': amount, 'note': note, 'type': type, 'date': date};
    debugPrint("Map Data --> $map");
    return map;
  }
}
