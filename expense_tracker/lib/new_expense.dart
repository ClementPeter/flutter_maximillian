import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //title and amount text field
  TextEditingController titleController =
      TextEditingController(text: 'expense title goes here');
  TextEditingController amountController = TextEditingController();

  //show date picker
  showDatePicker({
    required BuildContext context,
    required DateTime Function() initialDate,
    required DateTime Function() firstDate,
    required DateTime Function() lastDate,
  }) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now,
      firstDate: DateTime.now,
      lastDate: DateTime.now,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //title textfield
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: amountController,
            decoration:
                const InputDecoration(hintText: 'Amount', prefixText: '\$'),
            keyboardType: TextInputType.number,
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
                Expanded(
                  child: Row(
                    children: [
                      TextButton(
                        child: Text('cancel'),
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
