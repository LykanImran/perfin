import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:perfin/core/util/style_guide.dart';
import 'package:perfin/core/widgets/loading.dart';
import 'package:perfin/screens/home/data/transaction_repo.dart';
import 'package:perfin/screens/home/model/transaction_model.dart';
import 'package:perfin/screens/home/widgets/transaction_card.dart';

class TransactionList extends StatefulWidget {
  String title;
  TransactionList({this.title = ''});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  String queryType = '';
  void getQueryType() {
    if (widget.title == 'Income') {
      queryType = 'income';
    } else if (widget.title == 'Expense') {
      queryType = 'expense';
    } else {
      queryType = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    getQueryType();
    return Scaffold(
      backgroundColor: notWhite,
      appBar: AppBar(
        title: Text('${widget.title} Transactions'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: AnimationLimiter(
          child: RefreshIndicator(
            child: FirestorePagination(
              limit: 420, // Defaults to 10.
              viewType: ViewType.list,
              bottomLoader: Center(
                child: Loading(),
              ),
              query: TransactionRepository.getUserTransactions(queryType),
              itemBuilder: (context, documentSnapshot, index) {
                final data = documentSnapshot.data() as Map<String, dynamic>?;
                if (data == null) return Container();

                TransactionModel transaction =
                    TransactionModel.fromFirestore(documentSnapshot);
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: TransactionCard(
                        transaction: transaction,
                      ),
                    ),
                  ),
                );
              },
            ),
            onRefresh: () async {},
          ),
        ),
      ),
    );
  }
}
