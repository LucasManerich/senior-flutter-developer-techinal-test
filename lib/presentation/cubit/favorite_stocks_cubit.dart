import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';

class FavoriteStocksCubit extends Cubit<List<Stock>> {
  FavoriteStocksCubit() : super([]);

  void addFavorite(Stock stock) {
    final newState = [...state]; 
    newState.add(stock);
    emit(newState);
  }

  void removeFavorite(Stock stock) {
    final newState = [...state]; 
    newState.removeWhere((element) => element.getTicker() == stock.getTicker());
    emit(newState);
  }

  bool isFavorite(Stock stock) {
    return state.indexWhere((element) => element.getTicker() == stock.getTicker()) != -1;
  }
}