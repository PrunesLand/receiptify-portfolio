import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatsBaseScreen extends StatelessWidget {
  const StatsBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 300, child: Text('Main data')),
          Center(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/document');
                  },
                  child: Text('Add Document'),
                ),
              ],
            ),
          ),
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
      ),
    );
  }
}
