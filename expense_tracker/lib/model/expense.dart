import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//For generating uuid for each object instance
var uuid = const Uuid();

//enum to hold fixed values in our app
enum Category { food, travel, leisure, work }

//date formattiing using intl
final formatter = DateFormat.yMMMEd();

//mapping enum values to Icons
const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
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

  String //getter to fetch formatted date
      get formattedDate {
    // return DateFormat.yMMMEd().format(date);
    return formatter.format(date);
  }

  @override
  String toString() {
    return "Expense instance : $id";
  }
}
