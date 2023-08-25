import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expense});

  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) {
          //print("list view builder : $index");
          // return ListTile(
          //   title: Text(expense[index].title),
          //   subtitle: Text(expense[index].amount.toString()),
          //   //tileColor: ColorScheme.,
          //   // trailing: Row(children: [
          //   //   Text(expense[index].date);
          //   // ],),
          // );
          return ExpenseItem(
            expense: expense[index],
          );
        });
  }
}
