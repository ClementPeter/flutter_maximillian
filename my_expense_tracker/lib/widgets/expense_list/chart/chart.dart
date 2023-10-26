import 'package:my_expense_tracker/model/expense.dart';
import 'package:my_expense_tracker/widgets/expense_list/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  //getter for various categories
  List<ExpenseBucket> get buckets {
    return [
      //WRONG
      // ExpenseBucket(category: Category.food, expenses: expenses),
      // ExpenseBucket(category: Category.leisure, expenses: expenses),
      // ExpenseBucket(category: Category.travel, expenses: expenses),
      // ExpenseBucket(category: Category.work, expenses: expenses),

      //CORRECT
      ExpenseBucket.forCategory(allExpenses: expenses, category: Category.food),
      ExpenseBucket.forCategory(
          allExpenses: expenses, category: Category.leisure),
      ExpenseBucket.forCategory(
          allExpenses: expenses, category: Category.travel),
      ExpenseBucket.forCategory(allExpenses: expenses, category: Category.work)
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    print('maxTotalExpense: $maxTotalExpense');
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    //chart bg
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          //chart bars
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )

                //ChartBar(fill: 1),
                // ChartBar(fill: 0.5),
                // ChartBar(fill: 0.7),
                // ChartBar(fill: 0.2),
                // ChartBar(fill: 0.7),
                // ChartBar(fill: 0.4),
                // ChartBar(fill: 0.3),
              ],
            ),
          ),
          const SizedBox(height: 12),
          //chart bar icons
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcon[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
