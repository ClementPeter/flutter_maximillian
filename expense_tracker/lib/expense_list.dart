import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// //UI to hold scroll List of Items
class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expense, required this.onRemoveExpense});

  final List<Expense> expense;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) {
        //print("list view builder : $index");
        // return ListTile(
        //   title: Text(expense[index].title),
        //   subtitle: Text(expense[index].amount.toString()),
        // );
        return Dismissible(
          //key: Key(expense[index].id),
          key: ValueKey(expense[index]),
          //background: Container(color: kColorScheme.error.withOpacity(0.75)),
          background: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: kColorScheme.error.withOpacity(0.75),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.delete_outline,
                  color: kColorScheme.onError,
                  //size: 36.0,
                ),
              ],
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onRemoveExpense(expense[index]);
          },
          dragStartBehavior: DragStartBehavior.down,
          child: ExpenseItem(
            expense: expense[index],
          ),
        );
      },
    );
  }
}

///My implementation

// class ExpenseList extends StatelessWidget {
//   const ExpenseList(
//       {super.key, required this.expense, required this.onRemoveExpense});

//   final List<Expense> expense;
//   final void Function(Expense expense) onRemoveExpense;

//   @override
//   Widget build(BuildContext context) {
//     return expense.isEmpty
//         ? const Center(
//             child: Text('No expense found, Start adding some'),
//           )
//         : ListView.builder(
//             itemCount: expense.length,
//             itemBuilder: (context, index) {
//               //print("list view builder : $index");
//               // return ListTile(
//               //   title: Text(expense[index].title),
//               //   subtitle: Text(expense[index].amount.toString()),
//               // );
//               return Dismissible(
//                 //key: Key(expense[index].id),
//                 key: ValueKey(expense[index]),
      //  background: Container(
      //       margin: const EdgeInsets.symmetric(horizontal: 10),
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       decoration: BoxDecoration(
      //         color: kColorScheme.error.withOpacity(0.75),
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //       child: Row(
      //         children: [
      //           const Spacer(),
      //           Icon(
      //             Icons.delete_outline,
      //             color: kColorScheme.onError,
      //             //size: 36.0,
      //           ),
      //         ],
      //       ),
          // ),
//                 direction: DismissDirection.endToStart,
//                 onDismissed: (direction) {
//                   onRemoveExpense(expense[index]);
//                 },
//                 dragStartBehavior: DragStartBehavior.down,
//                 child: ExpenseItem(
//                   expense: expense[index],
//                 ),
//               );
//             },
//           );
//   }
// }
