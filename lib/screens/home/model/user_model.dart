import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? email;
  String? name;
  double? current;
  double? income;
  double? expense;
  UserModel(
      {this.id,
      this.email,
      this.name,
      this.current,
      this.income,
      this.expense});

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      email: (doc.data() as Map)['email'] ?? '',
      name: (doc.data() as Map)['name'] ?? 'name',
      current: (doc.data() as Map)['current'].toDouble() ?? 0,
      income: (doc.data() as Map)['income'].toDouble() ?? 0,
      expense: (doc.data() as Map)['expense'].toDouble() ?? 0,
    );
  }
}
