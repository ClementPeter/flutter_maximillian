import 'package:my_expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

//UI for the showModalBottomSheet
class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //title and amount text field
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  Category _selectedValue = Category.food;

  //submit method used in save expense button
  void _submitExpenseData() {
    //Modal Input validation
    final enteredAmount = double.tryParse(amountController.text.trim());
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (titleController.text.isEmpty || amountIsInvalid) {
      //show error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
              'Please make sure a valid title, amount and category was entered',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('okay'),
              )
            ],
          );
        },
      );
      return;
    }

    //passing data back to onAddExpense in expense.dart for expense to get added
    widget.onAddExpense(
      Expense(
        title: titleController.text.trim(),
        amount: enteredAmount,
        category: _selectedValue,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          //title textfield
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: amountController,
            decoration:
                const InputDecoration(hintText: 'Amount', prefixText: '\$ '),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          //Dropdown
          Row(
            children: [
              DropdownButton(
                value: _selectedValue,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  //print('dropDown::: $value:::');
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              const Spacer(),
              //save and cancel button
              Row(
                children: [
                  TextButton(
                    child: const Text('cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // print('::::${titleController.text}::::');
                      // print('::::${amountController.text}::::');
                      _submitExpenseData();
                    },
                    child: const Text('Save Expense'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
