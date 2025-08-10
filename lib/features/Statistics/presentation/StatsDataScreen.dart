import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/service_locator.dart';
import '../application/Statistics/statistics_bloc.dart';
import '../application/Statistics/statistics_event.dart';
import '../application/Statistics/statistics_state.dart';

class StatsDataScreen extends StatefulWidget {
  const StatsDataScreen({super.key});

  @override
  State<StatsDataScreen> createState() => _StatsDataScreenState();
}

class _StatsDataScreenState extends State<StatsDataScreen> {
  @override
  void initState() {
    getIt<StatisticsBloc>().add(StatisticsEvent.loadStats());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics'), centerTitle: true),
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        builder:
            (context, state) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  state.categoryCounts.entries.map((entry) {
                                    return Text(
                                      '${entry.key.name}: ${entry.value}',
                                    );
                                  }).toList(),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Most Frequent Category:'),
                                Text(
                                  state.mostFrequentCategory.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.mostFrequentCategoryQuantity.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
