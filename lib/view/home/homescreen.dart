import 'package:cartera/controller/model/transaction/transaction.dart';
import 'package:cartera/view/home/widget/chart/chart.dart';
import 'package:cartera/view/home/widget/new_transacton.dart';
import 'package:cartera/view/home/widget/trasaction_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _userTransaction = [];
  void _addNewTranscation(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  List<Transaction> get recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(
              addTx: _addNewTranscation,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 20,
          shadowColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                200,
                500,
              ),
              bottomRight: Radius.elliptical(
                200,
                500,
              ),
            ),
          ),
          title: const Text("Cartera"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Chart(recentTransaction: recentTransaction),
              TransactionList(transactions: _userTransaction)
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: FloatingActionButton(
            onPressed: (() {
              startAddNewTransaction(context);
            }),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
