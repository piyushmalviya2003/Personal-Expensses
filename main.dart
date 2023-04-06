import 'package:expense_calci/chart.dart';
import 'package:flutter/material.dart';
import './user_transaction.dart';
import './transaction_list.dart';
import './transaction.dart';
import './chart.dart';
import './new_transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PERSONAL EXPENSES',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //accentColor: Colors.amber,
      ),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  // late String titleInput;
  //late double amountInput;

  final List<Transaction> _userTransaction = [
    //Transaction(
    /// 't1',
    ///  ' New shirt',
    ///  1150,
    //  DateTime.now(),
    // ),
    ////// Transaction(
    ///   't2',
    ///  ' New watch',
    ///// 1250,
    // DateTime.now(),
    //),
  ];

  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txamount, DateTime chosendate) {
    final newTx = Transaction(
      DateTime.now().toString(),
      txTitle,
      txamount,
      chosendate,
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PERSONAL EXPENSES'),
        // ThemeData(
        //     primaryColor: Colors.purple,
        //     accentColor: Colors.amber,
        //     fontFamily: ' Quicksand',
        //     textTheme: ThemeData.light().textTheme.copyWith(
        //           title: TextStyle(
        //             fontFamily: 'OpenSans',
        //             fontWeight: FontWeight.bold,
        //             fontSize: 18,
        //           ),
        //           button: TextStyle(color: Colors.white),
        //         )),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransaction),
            //UserTransaction()
            TransactionList(_userTransaction, _deleteTransaction)
            //merge karne ke liye from user transaction
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
