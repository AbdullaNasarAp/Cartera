import 'package:cartera/controller/model/transaction/transaction.dart';
import 'package:cartera/view/home/widget/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction>? recentTransaction;
  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction!.length; i++) {
        if (recentTransaction![i].date.day == weekDay.day &&
            recentTransaction![i].date.month == weekDay.month &&
            recentTransaction![i].date.year == weekDay.year) {
          totalSum += recentTransaction![i].amount;
        }
      }

      return {
        'day': DateFormat.EEEE().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValue.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  const Chart({super.key, this.recentTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.blue,
        elevation: 15,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValue.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: data['day'] as String,
                    spendingAmount: data['amount'] as double,
                    spendingPcOfAmount: totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
            }).toList(),
          ),
        ));
  }
}
