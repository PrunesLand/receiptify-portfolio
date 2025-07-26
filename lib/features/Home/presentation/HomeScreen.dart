import 'package:flutter/cupertino.dart';
import 'package:receipt_app/features/PocketGroup/domain/index.dart';
import 'package:receipt_app/features/Statistics/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatsBaseScreen(
      args: BasicStats(
        pocket: PocketModel(
          title: 'Main',
          totalExpense: '5000',
          totalBudget: '5000',
        ),
      ),
    );
  }
}
