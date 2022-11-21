import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_get_stock_price_gateway/yahoo_finance_get_stock_price_gateway.dart';
import 'package:senior_flutter_developer_test/infra/adapter/http_query_string_adapter/http_query_string_adapter.dart';
import 'package:senior_flutter_developer_test/infra/adapter/dio_adapter/dio_adapter.dart';
import 'package:senior_flutter_developer_test/domain/enum/granularity.dart';
import 'package:senior_flutter_developer_test/domain/enum/range.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testa o gateway de acesso a API de preços de ações - PETR4 no dia ano por hora', () async {
    final getStockPrice = YahooFinanceGetStockPriceGateway(DioAdapter(), HttpQueryStringAdapter());
    final output = await getStockPrice.perform('PETR4.SA', granularity: Granularity.hour, range: Range.oneDay);
    expect(output.ticker, 'PETR4.SA');
    expect(output.currency, 'BRL');
    expect(output.values.isNotEmpty, true);
  });
}
