import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//Model for expense
//Expense Model
//For generating uuid for each object instance
var uuid = const Uuid();

//enum to hold fixed values in our app - used for our dropdowns and chart
enum Category { food, leisure, travel, work }

//date formatting using intl - yMMEd - mon, aug 28,2023
final formatter = DateFormat.yMMMEd();

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
  final DateTime date;
  final Category category;

  //passing uuid as initializer list to ensure it get generated on every object instance
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  //getter to fetch formatted date
  String get formattedDate {
    //return DateFormat.yMMMEd().format(date);
    return formatter.format(date);
  }

  @override
  String toString() {
    return "Expense instance : $id, $title";
  }
}

//Used to generate contents for the Charts
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  final Category category;
  final List<Expense> expenses;

  //getter -> return total sum of expenses amount
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      //sum = sum + expense.amount;
      sum += expense.amount;
    }

    // print('expensess : $expenses');
    // print('total expenses $sum');
    return sum;
  }

  //named constructor to filter expense by category
  ExpenseBucket.forCategory({
    required List<Expense> allExpenses,
    required this.category,
  }) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
}
