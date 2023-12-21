import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfin/core/util/style_guide.dart';
import 'package:perfin/core/widgets/base_card.dart';
import 'package:perfin/core/widgets/flushbar_helper.dart';
import 'package:perfin/core/widgets/primary_button.dart';
import 'package:perfin/core/widgets/rounded_widget.dart';
import 'package:perfin/screens/auth/components/my_text_field.dart';
import 'package:perfin/screens/home/data/transaction_repo.dart';
import 'package:perfin/screens/home/model/transaction_model.dart';

String incomeType = 'income';
String expenseType = 'expense';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  late TextEditingController amount, reason;
  String transactionType = incomeType;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    amount = TextEditingController();
    reason = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Current Selected Type $transactionType");
    return Scaffold(
      backgroundColor: notWhite,
      appBar: AppBar(
        title: Text('Add Transaction'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                BaseCard(
                    color: Colors.green,
                    elevation: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                            controller: amount,
                            hintText: 'Amount',
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            prefixIcon:
                                const Icon(FontAwesomeIcons.indianRupeeSign),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please fill in this field';
                              }

                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                            controller: reason,
                            hintText: 'Note for Transaction',
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            prefixIcon: const Icon(Icons.description),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please fill in this field';
                              }

                              return null;
                            }),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                BaseCard(
                    elevation: 0,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  transactionType = incomeType;
                                });
                              },
                              child: RoundedWidget(
                                  color: transactionType == incomeType
                                      ? primaryColor.withOpacity(0.15)
                                      : Colors.white,
                                  child: Row(
                                    children: [
                                      FaIcon(
                                          FontAwesomeIcons.arrowDownWideShort),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Income",
                                        style: display2,
                                      )
                                    ],
                                  )),
                            )),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  transactionType = expenseType;
                                });
                              },
                              child: RoundedWidget(
                                  color: transactionType == expenseType
                                      ? primaryColor.withOpacity(0.15)
                                      : Colors.white,
                                  child: Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.arrowUpShortWide),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Expense",
                                        style: display2,
                                      )
                                    ],
                                  )),
                            ))
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: PrimaryFlatBtn(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveTransaction();
                      }
                    },
                    title: 'Add Transaction',
                  ),
                )
              ],
            )),
      ),
    );
  }

  Future<void> saveTransaction() async {
    TransactionModel tr = TransactionModel();
    tr.amount = double.parse(amount.text);
    tr.note = reason.text;
    tr.type = transactionType;
    tr.getMap();
    FlushbarHelper().loadingFlush(context);
    bool isAdded = await TransactionRepository().addTransaction(tr);
    if (isAdded) {
      FlushbarHelper().successFlush(context);
    } else {
      FlushbarHelper().errorFlush(context);
    }
  }
}
