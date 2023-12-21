import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:perfin/screens/home/add_transaction.dart';
import 'package:perfin/screens/home/home_screen.dart';
import 'package:perfin/screens/home/model/transaction_model.dart';
import 'package:perfin/screens/home/model/user_model.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class TransactionRepository {
  static String email = _firebaseAuth.currentUser!.email!;

  static Future<UserModel> getUser() async {
    UserModel? user;
    debugPrint("Email --> ${email}");
    try {
      DocumentSnapshot snapshot =
          await _db.collection('users').doc(email).get();
      if (snapshot.exists) {
        user = UserModel.fromFirestore(snapshot);
        return user;
      } else {
        return user!;
      }
    } catch (err) {
      debugPrint("Err- in Get User-------> $err");
      rethrow;
    }
  }

  Future<bool> addTransaction(TransactionModel transaction) async {
    try {
      await _db
          .collection('users')
          .doc(email)
          .collection('transactions')
          .add(transaction.getMap());
      if (transaction.type == incomeType) {
        /// this is income
        user.income = user.income! + transaction.amount!;
        user.current = user.income! - user.expense!;
      } else {
        /// this is expense
        user.expense = user.expense! + transaction.amount!;
        user.current = user.income! - user.expense!;
      }
      await _db.collection('users').doc(email).update({
        'income': user.income,
        'expense': user.expense,
        'current': user.current
      });

      return true;
    } catch (err) {
      print('errr>>>>>>>>>>>>>>>>>>add TTra --- $err');
      return false;
    }
  }

  static Query getUserTransactions(String queryType) {
    var ref;
    if (queryType == '') {
      ref = _db
          .collection('users')
          .doc(email)
          .collection('transactions')
          .orderBy('date', descending: true);
    } else {
      ref = _db
          .collection('users')
          .doc(email)
          .collection('transactions')
          .where('type', isEqualTo: queryType)
          .orderBy('date', descending: true);
    }
    return ref;
  }
}
