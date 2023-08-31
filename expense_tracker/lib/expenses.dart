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

  //show modal
  void _openAddExpenseOverlay() {
    //print('modal pop up');
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const NewExpense();
      },
    );
  }

  // //show modal
  // void _openAddExpenseOverlay() {
  //   //print('modal pop up');
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           children: [
  //             //title textfield
  //             TextField(
  //               controller: titleController,
  //               decoration: const InputDecoration(labelText: 'title'),
  //             ),
  //             SizedBox(height: 10),
  //             TextField(
  //               controller: titleController,
  //               decoration: const InputDecoration(labelText: 'amount'),
  //             ),
  //             SizedBox(height: 20),
  //             //Dropdown
  //             // DropdownButton(
  //             // //   items: [
  //             // //   //DropdownMenuItem(child: ,)
  //             // // ],
  //             //    for(final entry in categoryIcon.entries)

  //             //  onChanged:
  //             //  ) ,

  //             // Row(
  //             //   children: [
  //             //     DropdownButton(items: [
  //             //       DropdownMenuItem(
  //             //         child: Text('LEISURE'),
  //             //       ),
  //             //       DropdownMenuItem(child: Text('TRAVEL'),)
  //             //     ], onChanged: (){}),
  //             //     //DropdownMenuItem(child: child)
  //             //     //save and cancel button
  //                 // Row(
  //                 //   children: [
  //                 //     Text('cancel'),
  //                 //     OutlinedButton(
  //                 //       onPressed: () {},
  //                 //       child: Text('Save Expense'),
  //                 //     ),
  //                 //     //Text('cancel'),
  //                 //   ],
  //                 // )
  //             //   ],
  //             // )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

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
            child: ExpenseList(expense: _registeredExpense),
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
