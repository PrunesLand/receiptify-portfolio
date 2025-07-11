import 'package:flutter/material.dart';

class StatsBaseScreen extends StatelessWidget {
  const StatsBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              return Card(child: Center(child: Text('Statistic ${index}')));
            },
          ),
        ),
      ],
    );
  }
}
