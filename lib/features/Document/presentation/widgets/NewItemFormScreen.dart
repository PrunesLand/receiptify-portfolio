import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/Enums/Enums.dart';
import '../../domain/models/Receipt/ReceiptModel.dart';

class NewItemFormScreen extends StatefulWidget {
  const NewItemFormScreen({super.key});

  @override
  State<NewItemFormScreen> createState() => _NewItemFormScreenState();
}

class _NewItemFormScreenState extends State<NewItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _costController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  ExpenseEnum _selectedCategory = ExpenseEnum.others;

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      builder:
          (context, child) => Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Theme.of(context).colorScheme.secondary,
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).colorScheme.secondary,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          ),
    );
    setState(() {
      _selectedDate = pickedDate ?? DateTime.now();
    });
  }

  void _submitData() {
    if (_costController.text.isEmpty) {
      print('Cost is empty');
      return;
    }
    final enteredCost = double.tryParse(_costController.text);

    final newReceipt = ReceiptModel(
      cost: enteredCost.toString(),
      receiptDate: _selectedDate,
      category: _selectedCategory,
    );

    Navigator.of(context).pop(newReceipt);
  }

  @override
  void dispose() {
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Receipt'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _costController,
                    decoration: InputDecoration(
                      labelText: 'Cost',
                      prefixText: '\$ ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the cost';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Picked Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          label: Text(
                            'Choose Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          onPressed: _presentDatePicker,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Select Category:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children:
                        ExpenseEnum.values.map((ExpenseEnum category) {
                          return ChoiceChip(
                            label: Text(category.name),
                            selected: _selectedCategory == category,
                            onSelected: (bool selected) {
                              setState(() {
                                _selectedCategory =
                                    selected ? category : ExpenseEnum.others;
                              });
                            },
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                            labelStyle: TextStyle(
                              color:
                                  _selectedCategory == category
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            backgroundColor: Colors.white,
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Submit Receipt',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitData();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
