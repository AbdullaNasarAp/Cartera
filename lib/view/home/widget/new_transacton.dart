import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function? addTx;

  const NewTransaction({super.key, this.addTx});

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
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No data added",
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.blue),
                        elevation: MaterialStateProperty.all(10),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {},
                    child: Text("Choose Date"),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all(Colors.blue),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              onPressed: submitData,
              child: const Text(
                "Add Transaction",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
