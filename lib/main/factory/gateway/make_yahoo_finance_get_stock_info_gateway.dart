import 'package:senior_flutter_developer_test/application/gateway/get_stock_info_gateway/get_stock_info_gateway.dart';
import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_get_stock_info_gateway/yahoo_finance_get_stock_info_gateway.dart';
import 'package:senior_flutter_developer_test/main/factory/adapter/make_dio_adapter.dart';

class MakeYahooFinanceGetStockInfoGateway {
  static GetStockInfoGateway make() {
    return YahooFinanceGetStockInfoGateway(MakeDioAdapter.make());
  }
}