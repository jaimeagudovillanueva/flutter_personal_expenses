import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 250,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat('dd/MM/yyyy')
                          .format(transactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTransaction(transactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
            ),
    );
  }
}
