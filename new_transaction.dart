import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_amountController.text == null) {
      return;
    }
    final enteredTitle = TextEditingController();
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle == null || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    //isempty loop problem for giving condition

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _amountController,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2003),
      lastDate: DateTime.now(),
    ).then((pickedData) {
      if (pickedData == null) {
        return;
      }
      setState(() {});
      _selectedDate = pickedData;
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        // height: 100,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData,
              // onChanged: (val) {
              //  titleInput = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              //onChanged: (val) => amountInput = val as double,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date  Chosen !'
                          : 'Picked Date:${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    //       textColor: Theme.of(context).primaryColor,
                    child: Text(
                      ' Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              //      color: Theme.of(context).primaryColor,
              //    textColour: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
