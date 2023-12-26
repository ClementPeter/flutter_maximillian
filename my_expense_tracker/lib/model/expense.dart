import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//Model for expense
//Expense Model
//For generating uuid for each object instance
var uuid = const Uuid();

//enum to hold fixed values in our app - used for our dropdowns and chart
enum Category { food, leisure, travel, work }

//date formattiing using intl - yMMEd - mon, aug 28,2023
//final dateFormatter = DateFormat.yMMMEd();
//final timeFormatter =  TimeOfDay(hour: time.hour, minute: time.minute);
// DateTime.now().toUtc().toIso8601String(),
//final dateTimeFormatter = DateTime.now().toUtc().toIso8601String();

//mapping enum values to Icons
const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final String date;
  final Category category;

  //passing uuid & date as initializer list to ensure it get generated on every object instance
  Expense({
    required this.title,
    required this.amount,
    required this.category,
  })  : id = uuid.v4(),
        date = DateTime.now().toLocal().toIso8601String();

  @override
  String toString() {
    return "Expense instance : $id, $title, $date";
  }
}

//Used to generate contents for the Charts
class ExpenseBucket {
  //
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  final Category category;
  final List<Expense> expenses;

  //named constructor to filter expense by category
  ExpenseBucket.forCategory({
    required List<Expense> allExpenses,
    required this.category,
  }) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  //getter -> return total sum of expenses amount
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      //sum = sum + expense.amount;
      sum += expense.amount;
    }
    print('total expenses $sum');
    return sum;
  }
}
