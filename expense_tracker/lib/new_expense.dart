import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

//UI for the showModalBottomSheet
class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //title and amount text field
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedValue = Category.food;

  // //show date picker
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

  void _showErrorSnackBar() {
    //Scaffold.of(context).
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Input Error'),
    ));
  }

  // //Date picker using .then
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
        //mainAxisSize: MainAxisSize.max,
        children: [
          //title textfield
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
            //keyboardAppearance: ,
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
          // Row(
          //   children: [
          //     //amount textfield
          // TextField(
          //   controller: titleController,
          //   decoration: const InputDecoration(hintText: 'Title'),
          // ),
          //     const Spacer(),
          //     //date picker
          //     DatePickerDialog(
          //       initialDate: DateTime.now(),
          //       firstDate: DateTime.now(),
          //       lastDate: DateTime.now(),
          //     )
          //     //showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
          //   ],
          // ),
          //Dropdown
          Row(
            children: [
              //const Text('Drop down'),
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
                      //Modal Input validation
                      final enteredAmount =
                          double.tryParse(amountController.text.trim());
                      var amountIsInvalid =
                          enteredAmount == null || enteredAmount <= 0;

                      if (titleController.text.isEmpty ||
                          amountIsInvalid ||
                          _selectedDate == null) {
                        //show error message
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text('Invalid Input'),
                              content: Text(
                                'Please make sure a valid title, amount, date and catergory was enntered',
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Save Expense'),
                  ),
                  //Text('cancel'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
