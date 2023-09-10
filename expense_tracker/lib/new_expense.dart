import 'package:expense_tracker/model/expense.dart';
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
  DateTime? _selectedDate;
  Category _selectedValue = Category.food;

  ///Date picker using .then
  // DateTime? _selectedDate;
  // void _presentDatePicker() {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(now.year - 1, now.month, now.day);
  //   showDatePicker(
  //     context: context,
  //     initialDate: now,
  //     firstDate: firstDate,
  //     lastDate: now,
  //   ).then((value) {
  //     print("value::::$value::::");
  //     _selectedDate = value;
  //     print("_selectedDateTOP::::$_selectedDate::::");
  //   });
  // }

  ///show date picker
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //submit method used in save expense button
  void _submitExpenseData() {
    //Modal Input validation
    final enteredAmount = double.tryParse(amountController.text.trim());
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (titleController.text.isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //show error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
              'Please make sure a valid title, amount, date and category was entered',
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
        date: _selectedDate!,
        category: _selectedValue,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                      hintText: 'Amount', prefixText: '\$ '),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: () {
                      print("_selectedDateOnpressed::::$_selectedDate::::");
                      _presentDatePicker();
                    },
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ),
            ],
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
