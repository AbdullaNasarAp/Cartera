import 'package:cartera/controller/transaction/transaction.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Buy a Iphone',
      amount: 129000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Buy a Watch',
      amount: 22000,
      date: DateTime.now(),
    ),
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cartera"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              child: Card(
                color: Colors.red,
                child: Text("grid"),
              )),
          Column(
            children: transactions.map((tsn) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tsn.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            tsn.date.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        "₹ ${tsn.amount.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
