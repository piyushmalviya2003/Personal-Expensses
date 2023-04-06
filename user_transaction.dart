import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      't1',
      ' New shirt',
      1150,
      DateTime.now(),
    ),
    Transaction(
      't2',
      ' New watch',
      1250,
      DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txamount) {
    final newTx = Transaction(
      DateTime.now().toString(),
      txTitle,
      txamount,
      DateTime.now(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        //TransactionList(_userTransaction)
      ],
    );
  }
}
