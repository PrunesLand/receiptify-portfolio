import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Statistics/domain/Models/BasicStats.dart';
import '../application/pocket_bloc.dart';
import '../application/pocket_state.dart';

class DataSelectionScreen extends StatelessWidget {
  const DataSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PocketBloc, PocketState>(
        builder:
            (context, state) =>
                state.pockets.isEmpty
                    ? Center(child: Text('No pockets found'))
                    : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: state.pockets.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                '/statistics',
                                extra: BasicStats(
                                  pocket: state.pockets[index],
                                  summaryExpense: '5999',
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.pockets[index].title,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Balance: ${state.pockets[index].totalBudget}',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
      ),
    );
  }
}
