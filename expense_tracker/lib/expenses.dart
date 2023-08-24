import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  //List of dummy expenses
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Travel Trip',
      amount: 1000,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Flutter Course',
      amount: 20.0,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema ',
      amount: 10.0,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      // body: Column(
      //   children: [
      //     Text('Chart'),
      //     Text('Expenses'),
      //   ],
      // ),
      // body: ListView(
      //   children:
      //       _registeredExpense.map((expense) => Text(expense.title)).toList(),
      // ),
      body: ExpenseList(expense: _registeredExpense),
    );
  }
}
