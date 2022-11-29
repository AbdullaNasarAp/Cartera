import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function? addTx;

  NewTransaction({super.key, this.addTx});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx!(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                  onSubmitted: (_) => submitData()),
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  hintText: "Amount",
                ),
                onSubmitted: (_) => submitData(),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text(
                  "Add Transaction",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
