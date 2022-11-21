import 'package:senior_flutter_developer_test/application/gateway/get_stock_price_gateway/get_stock_price_gateway.dart';
import 'package:senior_flutter_developer_test/application/gateway/get_stock_info_gateway/get_stock_info_gateway.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price_builder.dart';
import 'package:senior_flutter_developer_test/domain/repository/find_stock_repository.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock_builder.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';

class RemoteFindStockRepository implements FindStockRepository {
  final GetStockInfoGateway _getStockInfoGateway;
  final GetStockPriceGateway _getStockPriceGateway;

  RemoteFindStockRepository(this._getStockInfoGateway, this._getStockPriceGateway);

  @override
  Future<Stock> find (String ticker) async {
    final stockInfoOutput = await _getStockInfoGateway.perform(ticker);
    final priceList = await _getPriceList(ticker);
    return StockBuilder()
      .setTicker(stockInfoOutput.ticker)
      .setLongName(stockInfoOutput.longName)
      .setShortName(stockInfoOutput.shortName)
      .setStockPriceList(priceList)
      .build();
  }

  Future<List<StockPrice>> _getPriceList (String ticker) async {
    final stockPriceOutput = await _getStockPriceGateway.perform(ticker);
    return stockPriceOutput.values.map((stockPrice) {
      return StockPriceBuilder()
        .setDate(stockPrice.date)
        .setOpenValue(stockPrice.openValue)
        .setCloseValue(stockPrice.closeValue)
        .setHighValue(stockPrice.highValue)
        .setLowValue(stockPrice.lowValue)
        .setVolume(stockPrice.volume)
        .build();
    }).toList();
  }
}