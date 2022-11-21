import 'package:senior_flutter_developer_test/domain/repository/find_stock_repository.dart';
import 'package:senior_flutter_developer_test/infra/repository/remote_find_stock_repository.dart';
import 'package:senior_flutter_developer_test/main/factory/gateway/make_yahoo_finance_get_stock_info_gateway.dart';
import 'package:senior_flutter_developer_test/main/factory/gateway/make_yahoo_finance_get_stock_price_gateway.dart';

class MakeRemoteFindStockRepository {
  static FindStockRepository make() {
    return RemoteFindStockRepository(
      MakeYahooFinanceGetStockInfoGateway.make(),
      MakeYahooFinanceGetStockPriceGateway.make()
    );
  }
}