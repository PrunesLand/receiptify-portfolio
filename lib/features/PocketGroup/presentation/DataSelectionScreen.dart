import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:receipt_app/features/PocketGroup/domain/index.dart';
import 'package:receipt_app/features/PocketGroup/presentation/widgets/Modal.dart';

import '../../../core/service_locator.dart';
import '../application/pocket_bloc.dart';
import '../application/pocket_event.dart';
import '../application/pocket_state.dart';

class DataSelectionScreen extends StatefulWidget {
  const DataSelectionScreen({super.key});

  @override
  State<DataSelectionScreen> createState() => _DataSelectionScreenState();
}

class _DataSelectionScreenState extends State<DataSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<PocketModel>(
            context: context,
            builder: (context) => BudgetModal(),
          );
          getIt<PocketBloc>().add(PocketEvent.addPocket(result!));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Center(child: Text('Select pocket')),
          Expanded(
            child: BlocBuilder<PocketBloc, PocketState>(
              builder:
                  (context, state) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: state.pockets.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push('/statistics');
                        },
                        child: Card(
                          child: Center(child: Text('Pocket $index')),
                        ),
                      );
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
