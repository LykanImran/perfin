import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfin/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:perfin/core/util/number_helper.dart';
import 'package:perfin/core/util/style_guide.dart';
import 'package:perfin/core/widgets/primary_button.dart';
import 'package:perfin/screens/home/home_screen.dart';
import 'package:perfin/screens/home/model/user_model.dart';
import 'package:perfin/screens/home/transaction_list.dart';
import 'package:perfin/screens/home/widgets/dash_card.dart';
import 'package:perfin/screens/home/widgets/logout_dialog.dart';

class DashBoard extends StatefulWidget {
  DashBoard();

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionList(
                            title: "All",
                          )));
            },
            child: DashCard(
              title: "${getIndianCurrency(user!.current)}",
              subtitle: "Current Balance",
              color: primaryColor,
              icon: FontAwesomeIcons.arrowUpRightDots,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionList(
                            title: "Income",
                          )));
            },
            child: DashCard(
              title: "${getIndianCurrency(user!.income)}",
              subtitle: "Income",
              color: Colors.green,
              icon: FontAwesomeIcons.arrowDownWideShort,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionList(
                            title: "Expense",
                          )));
            },
            child: DashCard(
              title: "${getIndianCurrency(user!.expense)}",
              subtitle: "Expense",
              color: Colors.red,
              icon: FontAwesomeIcons.arrowUpShortWide,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: PrimaryOutlinedButton(
                title: "Log Out",
                icon: FontAwesomeIcons.powerOff,
                onPressed: () {
                  context.read<SignInBloc>().add(const SignOutRequired());

                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return LogoutConfirmationDialog();
                  //   },
                  // );
                },
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
