import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  // get transactions => transactions;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      child: transactions.isEmpty
          ? Text(
              'Thank you',
              textAlign: TextAlign.center,
            )
          : Column(
              children: [
                Text(
                  'NO TRANSACTION  !',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
    );

    //     Image(image:Image.)

    ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          //       child : Row(
          //         children: <Widget> [
          //           Container(
          //             margin: EdgeInsets.symmetric(
          //               vertical: 10,
          //               horizontal: 15,

          //             ),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: Theme.of(context).primaryColor,
          //                 width: 2,

          //               ),
          //             ),
          //    ),
          //  ],
          //        ),
          //     );
          // }
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                    '\$${transactions[index].amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              DateFormat.yMMMEd().format(transactions[index].date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              //Theme.of(context).errorColor,
              onPressed: () => {
                deleteTx(transactions[index].id),
              },
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
