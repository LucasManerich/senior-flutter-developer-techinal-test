import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_get_stock_price_gateway/yahoo_finance_get_stock_price_gateway.dart';
import 'package:senior_flutter_developer_test/application/gateway/get_stock_price_gateway/get_stock_price_gateway.dart';
import 'package:senior_flutter_developer_test/main/factory/adapter/make_http_query_string_adapter.dart';
import 'package:senior_flutter_developer_test/main/factory/adapter/make_dio_adapter.dart';

class MakeYahooFinanceGetStockPriceGateway {
  static GetStockPriceGateway make() {
    return YahooFinanceGetStockPriceGateway(MakeDioAdapter.make(), MakeHttpQueryStringAdapter.make());
  }
}