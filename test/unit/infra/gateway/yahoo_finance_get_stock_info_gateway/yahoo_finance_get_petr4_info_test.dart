import 'package:flutter_test/flutter_test.dart';
import 'package:senior_flutter_developer_test/infra/adapter/dio_adapter/dio_adapter.dart';
import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_get_stock_info_gateway/yahoo_finance_get_stock_info_gateway.dart';

void main() {
  test('Testa o gateway de acesso a API de busca de ações - PETR4', () async {
    final getStockInfo = YahooFinanceGetStockInfoGateway(DioAdapter());
    final output = await getStockInfo.perform('PETR4.SA');
    expect(output.ticker, 'PETR4.SA');
    expect(output.shortName, 'PETROBRAS   PN      N2');
    expect(output.longName, 'Petróleo Brasileiro S.A. - Petrobras');
  });
}
