import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';

abstract class FindStockRepository {
  Future<Stock> find(String ticker);
}