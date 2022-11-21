import 'package:senior_flutter_developer_test/domain/repository/find_stock_repository.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockViewCubit extends Cubit<Stock?> {
  final FindStockRepository _findStockRepository;
  StockViewCubit(this._findStockRepository) : super(null);

  Future<void> loadStock(String ticker) async {
    Stock stock = await _findStockRepository.find(ticker);
    emit(stock);
  }

  void leave(Stock stock) {
    emit(null);
  }
}