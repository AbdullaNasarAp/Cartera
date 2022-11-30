import 'package:cartera/controller/model/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions});
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 455,
        child: transactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "No transaction added yet!!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset("assets/image/icons8-wallet-96.png")
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      transactions[index].title,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('EEE ,MMM ,d ,y')
                          .add_jm()
                          .format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.red,
                              style: BorderStyle.solid,
                              width: 2)),
                      child: Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "₹ ${transactions[index].amount.toString()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  );
                }));
  }
}
