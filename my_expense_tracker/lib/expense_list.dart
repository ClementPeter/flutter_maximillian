import 'package:my_expense_tracker/main.dart';
import 'package:my_expense_tracker/model/expense.dart';
import 'package:my_expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

//UI to hold scroll List of Items
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            //key: Key(expense[index].id),
            key: ValueKey(expense[index]),
            background: Container(
              padding: const EdgeInsets.all(8),
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
            //dragStartBehavior: DragStartBehavior.start,
            child: ExpenseItem(
              expense: expense[index],
            ),
          ),
        );
      },
    );
  }
}

///My implementation

// class ExpenseList extends StatelessWidget {
//   const ExpenseList({
//     super.key,
//     required this.expense,
//     required this.onRemoveExpense,
//   });

//   final List<Expense> expense;
//   final void Function(Expense expense) onRemoveExpense;

//   @override
//   Widget build(BuildContext context) {
//     return expense.isEmpty
//         ? const Center(
//             child: Text('No expense found, Start adding some'),
//           )
//         : Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView.builder(
//               itemCount: expense.length,
//               itemBuilder: (context, index) {
//                 //print("list view builder : $index");
//                 // return ListTile(
//                 //   title: Text(expense[index].title),
//                 //   subtitle: Text(expense[index].amount.toString()),
//                 // );
//                 return Dismissible(
//                   //key: Key(expense[index].id),
//                   key: ValueKey(expense[index]),
//                   direction: DismissDirection.endToStart,
//                   onDismissed: (direction) {
//                     onRemoveExpense(expense[index]);
//                   },
//                   background: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Container(
//                       //margin: const EdgeInsets.symmetric(horizontal: 50),
//                       padding: const EdgeInsets.only(right: 20),
//                       decoration: BoxDecoration(
//                         color: kColorScheme.error.withOpacity(0.75),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         children: [
//                           const Spacer(),
//                           Icon(
//                             Icons.delete_outline,
//                             color: kColorScheme.onError,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: ExpenseItem(
//                       expense: expense[index],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//   }
// }
