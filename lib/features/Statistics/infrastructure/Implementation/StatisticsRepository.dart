import 'package:receipt_app/features/Statistics/domain/Models/BasicStats.dart';
import 'package:receipt_app/features/Statistics/domain/Repository/IStatisticsRepository.dart';

import '../Service/StatisticsRepositoryService.dart';

class StatisticsRepository implements IStatisticsRepository {
  final StatisticsRepositoryService _statisticsRepositoryService;

  StatisticsRepository(this._statisticsRepositoryService);

  @override
  Future<BasicStats> getBasicStats() {
    // TODO: implement getBasicStats
    throw UnimplementedError();
  }
}
