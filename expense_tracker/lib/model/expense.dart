import 'package:uuid/uuid.dart';

//For generating uuid for each object instance
var uuid = const Uuid();

//enum to hold fixed values in our app
enum Category { food, leisure, travel, work }

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

  @override
  String toString() {
    return "Expense instance : $id";
  }
}
