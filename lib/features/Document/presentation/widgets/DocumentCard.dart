import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Expense:'),
            Text('\$XXX'),
            Text(DateFormat('d/M/y').format(date)),
          ],
        ),
      ),
    );
  }
}
