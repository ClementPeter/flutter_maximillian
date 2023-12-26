import 'package:my_expense_tracker/main.dart';
import 'package:my_expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

//Expense item - card like UI containing expense item
class ExpenseItem extends StatefulWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: kColorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      // margin: Theme.of(context).cardTheme.margin,
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
                  widget.expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(widget.expense.amount.toStringAsFixed(2))
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.alarm_add),
                    const SizedBox(width: 10),
                    //Text(expense.formattedDateTime.toString().substring(10, 15))
                    Text(widget.expense.date.substring(0, 10))
                  ],
                ),
                Row(
                  children: [
                    Icon(categoryIcon[widget.expense.category]),
                    const SizedBox(width: 20),
                    Text(widget.expense.date.substring(11, 19))
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
