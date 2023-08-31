import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  //title textController
  TextEditingController titleController = TextEditingController();

  //List of dummy expenses
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Travel Trip',
      amount: 1000,
      date: DateTime.now(),
      category: Category.travel,
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

  //function to add New Expense
  void _addExpense(Expense expense) {
    print("new Expense:::$expense::::");
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    //get index for undo feature
    final expenseIndex = _registeredExpense.indexOf(expense);

    setState(() {
      _registeredExpense.remove(expense);
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
                //insert removed item with it's index
                _registeredExpense.insert(expenseIndex, expense);
              });
            }),
      ),
    );

    //ScaffoldMessenger.of(context).clearSnackBars();
  }

  //show ModalBottomSheet
  void _openAddExpenseOverlay() {
    //print('modal pop up');
    showModalBottomSheet(
      context: context,
      barrierLabel: 'modal sheet',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpenseList(
              expense: _registeredExpense,
              onRemoveExpense: _removeExpense,
            ),
          ),
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
