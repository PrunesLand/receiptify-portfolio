import 'package:flutter/material.dart';

class StatsWidget extends StatefulWidget {
  const StatsWidget({super.key});

  @override
  State<StatsWidget> createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Data title', style: TextStyle(fontSize: 10)),
            Text('Data', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
