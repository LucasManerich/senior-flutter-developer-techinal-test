import 'package:senior_flutter_developer_test/main/factory/repository/make_remote_find_stock_repository.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/stock_view_cubit.dart';

class MakeStockViewCubit {
  static StockViewCubit make() {
    return StockViewCubit(MakeRemoteFindStockRepository.make());
  }
}