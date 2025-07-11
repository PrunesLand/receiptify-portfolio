import '../Models/BasicStats.dart';

abstract class IStatisticsRepository {
  Future<BasicStats> getBasicStats();
}
