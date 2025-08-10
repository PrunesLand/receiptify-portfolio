import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_app/features/Statistics/application/Statistics/statistics_event.dart';
import 'package:receipt_app/features/Statistics/application/Statistics/statistics_state.dart';
import 'package:receipt_app/features/User/index.dart';

import '../../utils.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final UserStorageRepository _userStorageRepository;

  StatisticsBloc(this._userStorageRepository) : super(StatisticsState()) {
    on<StatisticsEvent>((event, emit) async {
      await event.when(
        loadStats: () async {
          final expenses =
              await _userStorageRepository.getAllDocumentsFromMainPockets();

          final categoryCounts = await getCategoryCounts(expenses);

          final mostFrequentCategory = await getMostFrequentCategory(
            categoryCounts,
          );

          emit(
            state.copyWith(
              isLoading: true,
              categoryCounts: categoryCounts,
              mostFrequentCategory: mostFrequentCategory.key,
              mostFrequentCategoryQuantity: mostFrequentCategory.value,
            ),
          );
        },
      );
    });
  }
}
