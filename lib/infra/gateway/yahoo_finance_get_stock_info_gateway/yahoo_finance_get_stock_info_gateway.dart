import 'package:senior_flutter_developer_test/application/gateway/get_stock_info_gateway/get_stock_info_gateway.dart';
import 'package:senior_flutter_developer_test/application/gateway/get_stock_info_gateway/get_stock_info_output_dto.dart';
import 'package:senior_flutter_developer_test/domain/adapter/http_request_adapter/http_request_adapter.dart';
import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_gateway/yahoo_finance_gateway.dart';

class YahooFinanceGetStockInfoGateway extends YahooFinanceGateway implements GetStockInfoGateway {
  static const path = '/v7/finance/options';

  YahooFinanceGetStockInfoGateway(HttpRequestAdapter httpRequestAdapter) : super(httpRequestAdapter);

  @override
  Future<GetStockInfoOutputDto> perform(String ticker) async {
    final String query = "$path/$ticker";
    final response = await callApi(query);
    final result = response['optionChain']['result'].first;
    return _createOutputDto(result['quote']);
  }

  GetStockInfoOutputDto _createOutputDto(Map<String, dynamic> map) {
    return GetStockInfoOutputDto(
      longName: map['longName'], 
      shortName: map['shortName'], 
      ticker: map['symbol'], 
      marketCap: map['marketCap']
    );
  }
}