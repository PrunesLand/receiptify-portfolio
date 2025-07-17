import 'package:flutter/material.dart';
import 'package:receipt_app/features/PocketGroup/domain/index.dart';

class BudgetModal extends StatefulWidget {
  const BudgetModal({super.key});

  @override
  State<BudgetModal> createState() => _BudgetModalState();
}

class _BudgetModalState extends State<BudgetModal> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _totalBudget = '';
  String _totalExpense = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Set Budget'),
      content: SizedBox(
        height: 250,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _title = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Your budget goal'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _totalBudget = value ?? '';
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(labelText: 'Max Expense'),
              //   keyboardType: TextInputType.number,
              //   onSaved: (value) {
              //     _totalExpense = value ?? '';
              //   },
              // ),
            ],
          ),
        ),
      ),
      actions: [TextButton(onPressed: () => _onSubmit(), child: Text('Set'))],
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final data = PocketModel(
        title: _title,
        totalExpense: _totalExpense,
        totalBudget: _totalBudget,
      );
      Navigator.of(context).pop(data);
    }
  }
}
