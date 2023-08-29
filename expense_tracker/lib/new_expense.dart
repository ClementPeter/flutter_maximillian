import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

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

  // //using .then
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
                  Text(_selectedDate == null
                      ? 'No Date Selected'
                      : formatter.format(_selectedDate!)),
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
          Expanded(
            child: Row(
              children: [
                const Text('Drop down'),
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
                        print('::::${titleController.text}::::');
                        print('::::${amountController.text}::::');
                      },
                      child: const Text('Save Expense'),
                    ),
                    //Text('cancel'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
