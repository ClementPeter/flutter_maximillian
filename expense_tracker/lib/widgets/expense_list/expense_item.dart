// import 'package:expense_tracker/model/expense.dart';
// import 'package:flutter/material.dart';

// //Expense item - card like UI containing expense item
// class ExpenseItem extends StatelessWidget {
//   const ExpenseItem({super.key, required this.expense});

//   final Expense expense;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: Theme.of(context).cardTheme.margin,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   expense.title,
//                   //style: const TextStyle(fontWeight: FontWeight.bold),
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 const SizedBox(height: 5),
//                 Text(expense.amount.toStringAsFixed(2))
//               ],
//             ),
//             Row(
//               children: [
//                 Icon(categoryIcon[expense.category]),
//                 const SizedBox(width: 5),
//                 Text(expense.formattedDate)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
