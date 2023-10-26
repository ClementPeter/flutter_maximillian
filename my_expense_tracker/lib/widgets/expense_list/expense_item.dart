import 'package:my_expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

//Expense item - card like UI containing expense item
class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Theme.of(context).cardTheme.margin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(expense.amount.toStringAsFixed(2))
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.alarm_add),
                    const SizedBox(width: 5),
                    Text(expense.formattedTime.toString().substring(10, 15))
                  ],
                ),
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    const SizedBox(width: 5),
                    Text(expense.formattedDate)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
