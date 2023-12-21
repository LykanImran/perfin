import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfin/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:perfin/core/util/const.dart';
import 'package:perfin/core/util/shared_pref.dart';
import 'package:perfin/core/util/style_guide.dart';
import 'package:perfin/core/widgets/base_card.dart';
import 'package:perfin/core/widgets/loading.dart';
import 'package:perfin/screens/home/add_transaction.dart';
import 'package:perfin/screens/home/dashboard.dart';
import 'package:perfin/screens/home/data/transaction_repo.dart';
import 'package:perfin/screens/home/model/user_model.dart';
import 'package:perfin/screens/home/transaction_list.dart';
import 'package:perfin/screens/home/widgets/dash_card.dart';
import 'package:perfin/screens/home/widgets/transaction_info_builder.dart';

UserModel user = UserModel();

class HomeScreen extends StatelessWidget {
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: notWhite,
      appBar: AppBar(
        title: Text(appName),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransaction()));
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<UserModel>(
        future: TransactionRepository
            .getUser(), // Your function to fetch data from Firebase
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Loading(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available');
          } else {
            // Data has been successfully fetched
            final data = snapshot.data!;
            user = data;
            return DashBoard();
          }
        },
      ),
    );
  }
}
