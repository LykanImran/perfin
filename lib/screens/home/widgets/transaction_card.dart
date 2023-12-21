import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfin/core/util/date_helper.dart';
import 'package:perfin/core/util/number_helper.dart';
import 'package:perfin/core/util/style_guide.dart';
import 'package:perfin/core/widgets/base_card.dart';
import 'package:perfin/core/widgets/border_widget.dart';
import 'package:perfin/screens/home/add_transaction.dart';
import 'package:perfin/screens/home/model/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  TransactionModel? transaction;
  TransactionCard({this.transaction});

  @override
  Widget build(BuildContext context) {
    bool isIncome = transaction!.type == incomeType;
    String num = getIndianCurrency(transaction!.amount).toString();
    debugPrint("CHanged Amt ---> $num");
    return BaseCard(
        elevation: 0,
        color: isIncome ? Colors.green : Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BorderWidget(
                  color: isIncome ? Colors.green : Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(
                      isIncome
                          ? FontAwesomeIcons.arrowDownWideShort
                          : FontAwesomeIcons.arrowUpShortWide,
                      color: isIncome ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${transaction!.note}",
                      style: display3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${DateHelper().getLongFormDate(transaction!.date!)}',
                      style: body2.copyWith(color: Colors.grey),

                      /// body2
                    )
                  ],
                ),
              ],
            ),
            Text(
              "${isIncome ? '+' : '-'} $num",
              style: display3.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isIncome ? Colors.green : Colors.red),
            ),
          ],
        ));
  }
}
