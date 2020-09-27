import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                // return Card(
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Container(
                //           margin: EdgeInsets.symmetric(
                //               horizontal: 20, vertical: 15),
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: Theme.of(context).primaryColor,
                //               width: 3,
                //             ),
                //           ),
                //           child: Text(
                //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                //             style: TextStyle(
                //               fontSize: 25,
                //               color: Theme.of(context).primaryColor,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           padding: EdgeInsets.all(10),
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           margin: EdgeInsets.symmetric(
                //               vertical: 15, horizontal: 15),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 transactions[index].title,
                //                 style: Theme.of(context).textTheme.headline6,
                //               ),
                //               Text(
                //                 DateFormat().format(transactions[index].date),
                //                 style: TextStyle(
                //                   color: Colors.grey,
                //                   fontSize: 18,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // );
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  elevation: 8,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
