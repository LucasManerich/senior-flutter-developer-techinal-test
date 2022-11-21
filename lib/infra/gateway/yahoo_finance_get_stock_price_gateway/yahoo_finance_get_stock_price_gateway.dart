import 'package:senior_flutter_developer_test/application/gateway/get_stock_price_gateway/get_stock_price_output_price_item_dto.dart';
import 'package:senior_flutter_developer_test/application/gateway/get_stock_price_gateway/get_stock_price_output_dto.dart';
import 'package:senior_flutter_developer_test/application/gateway/get_stock_price_gateway/get_stock_price_gateway.dart';
import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_get_stock_price_gateway/yahoo_finance_granularity_enum.dart';
import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_get_stock_price_gateway/yahoo_finance_range_enum.dart';
import 'package:senior_flutter_developer_test/domain/adapter/http_request_adapter/http_request_adapter.dart';
import 'package:senior_flutter_developer_test/domain/adapter/query_string_adapter/query_string_adapter.dart';
import 'package:senior_flutter_developer_test/infra/gateway/yahoo_finance_gateway/yahoo_finance_gateway.dart';
import 'package:senior_flutter_developer_test/domain/enum/granularity.dart';
import 'package:senior_flutter_developer_test/domain/enum/range.dart';

class YahooFinanceGetStockPriceGateway extends YahooFinanceGateway implements GetStockPriceGateway {
  final QueryStringAdapter _queryStringAdapter;
  static const path = '/v8/finance/chart';

  YahooFinanceGetStockPriceGateway(HttpRequestAdapter httpRequestAdapter, this._queryStringAdapter) : super(httpRequestAdapter);

  @override
  Future<GetStockPriceOutputDto> perform(String ticker, { granularity = Granularity.day, range = Range.oneMonth }) async {
    final response = await runApiCall(ticker, granularity, range);
    final stockData = response['chart']['result'].first;
    return _createOutputDto(stockData);
  }

  dynamic runApiCall(String ticker, Granularity granularity, Range range) async {
    String queryString = _queryStringAdapter.fromMap({
      'interval': YahooFinanceGranularityEnum.formatForQueryString(granularity),
      'range': YahooFinanceRangeEnum.formatForQueryString(range)
    });
    final String query = "$path/$ticker?$queryString";
    return await callApi(query);
  }

  GetStockPriceOutputDto _createOutputDto(Map<String, dynamic> stockData) {
    return GetStockPriceOutputDto(
      values: _createItemOutputDto(stockData), 
      currency: stockData['meta']['currency'], 
      ticker: stockData['meta']['symbol']
    );
  }

  List<GetStockPriceOutputPriceItemDto> _createItemOutputDto(Map<String, dynamic> stockData) {
    List<int> timestampList = List.from(stockData['timestamp']);
    Map<String, dynamic> stockPrice = stockData['indicators']['quote'].first;
    List<double> closeValues = extractValueFromStockPrice('close', stockPrice);
    List<double> openValues = extractValueFromStockPrice('open', stockPrice);
    List<double> highValues = extractValueFromStockPrice('high', stockPrice);
    List<double> lowValues = extractValueFromStockPrice('low', stockPrice);
    List<double> volumeValues = extractValueFromStockPrice('volume', stockPrice);
    return timestampList.map((timestamp) {
      final index = timestampList.indexOf(timestamp);
      return GetStockPriceOutputPriceItemDto(
        date: DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
        openValue: openValues[index], 
        closeValue: closeValues[index], 
        highValue: highValues[index], 
        lowValue: lowValues[index],
        volume: volumeValues[index]
      );
    }).toList();
  }

  List<double> extractValueFromStockPrice(String item, Map<String, dynamic> stockPrice) {
    List<dynamic> dataList = stockPrice[item];
    return List<double>.from(dataList.map((value) => double.parse(value.toString())));
  }
}