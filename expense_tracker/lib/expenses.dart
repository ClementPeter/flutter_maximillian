import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/expense_list/chart/chart.dart';

import 'package:flutter/material.dart';

//Main UI screen
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
      amount: 100,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Flutter Course',
      amount: 20,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema ',
      amount: 5,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  //add New Expense function
  void _addExpense(Expense expense) {
    print("new Expense:::$expense::::");
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  //remove expense function - snackbar and undo feature
  void _removeExpense(Expense expense) {
    //get index of Item to be removed for undo feature
    final expenseIndex = _registeredExpense.indexOf(expense);

    //remove item
    setState(() {
      _registeredExpense.remove(expense);
      return;
    });

    //clearSnackBars stays before the snackbar usage to work
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              print('::undo::');
              //insert removed item back using it's index
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  //show ModalBottomSheet
  void _openAddExpenseOverlay() {
    //print('modal pop up');
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true, //Full screen ModalBottomSheet
      showDragHandle: true,
      useSafeArea: true,
      builder: (context) {
        return NewExpense(onAddExpense: _addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found, Start adding some'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expense: _registeredExpense,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          //chart
          Chart(expenses: _registeredExpense),
          Expanded(child: mainContent),
          //if you use my expense List implementation
          // Expanded(
          //   child: ExpenseList(
          //     expense: _registeredExpense,
          //     onRemoveExpense: _removeExpense,
          //   ),
          // ),
        ],
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
    );
  }
}
