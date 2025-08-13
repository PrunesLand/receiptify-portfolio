import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import Syncfusion charts

import '../../../core/service_locator.dart';
import '../application/Statistics/statistics_bloc.dart';
import '../application/Statistics/statistics_event.dart';
import '../application/Statistics/statistics_state.dart';
import '../domain/Models/CategoryCounts.dart'; // Corrected import path

class StatsDataScreen extends StatefulWidget {
  const StatsDataScreen({super.key});

  @override
  State<StatsDataScreen> createState() => _StatsDataScreenState();
}

class _StatsDataScreenState extends State<StatsDataScreen> {
  @override
  void initState() {
    super.initState();
    // Load stats when the screen is first initialized
    getIt<StatisticsBloc>().add(const StatisticsEvent.loadStats());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics'), centerTitle: true),
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        builder: (context, state) {
          // Show a loading indicator while data is being fetched
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show an empty state message if there's no data
          if (state.categoryCounts.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.pie_chart_outline,
                      size: 64,
                      color: colorScheme.onSurface.withOpacity(0.4),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No statistics to show yet.',
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // Main content with statistics and chart
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- 1. Pie Chart Section ---
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('Category Breakdown', style: textTheme.titleLarge),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 300, // Give the chart a fixed height
                          child: SfCircularChart(
                            // Initialize the pie chart
                            legend: const Legend(
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                              position: LegendPosition.bottom,
                            ),
                            series: <CircularSeries>[
                              PieSeries<CategoryCount, String>(
                                dataSource: state.categoryCounts,
                                xValueMapper:
                                    (CategoryCount data, _) =>
                                        data.category.name,
                                yValueMapper:
                                    (CategoryCount data, _) => data.count,
                                // EDITED: Conditionally provide the label text
                                dataLabelMapper: (CategoryCount data, _) {
                                  // If the count is 0, return null to hide the label.
                                  // Otherwise, return the count as a string to display it.
                                  return data.count > 0
                                      ? data.count.toString()
                                      : null;
                                },
                                // Enable data labels to show values on the chart
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                enableTooltip: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // --- 2. Key Statistics Section ---
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Key Stats', style: textTheme.titleLarge),
                        const SizedBox(height: 16),
                        _buildStatRow(
                          icon: Icons.star_border,
                          label: 'Most Frequent Category:',
                          value: state.mostFrequentCategory.name,
                          iconColor: Colors.amber,
                        ),
                        const SizedBox(height: 8),
                        _buildStatRow(
                          icon: Icons.format_list_numbered,
                          label: 'Receipts in Category:',
                          value: state.mostFrequentCategoryQuantity.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper widget to build consistent stat rows
  Widget _buildStatRow({
    required IconData icon,
    required String label,
    required String value,
    Color? iconColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 12),
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        const Spacer(),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
