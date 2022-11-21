import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price_variation.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price_variation_mediator.dart';

class StockImpl implements Stock {
  final String _ticker;
  final String _shortName;
  final String _longName;
  final List<StockPrice> _stockPriceList;

  StockImpl(this._ticker, this._shortName, this._longName, this._stockPriceList);

  @override
  String getLongName() {
    return _longName;
  }

  @override
  String getShortName() {
    return _shortName;
  }

  @override
  String getTicker() {
    return _ticker;
  }

  @override
  List<StockPrice> getStockPrice() {
    return _stockPriceList;
  }

  @override
  StockPriceVariation getPriceVariation() {
    return StockPriceVariationMediator(_stockPriceList);
  }

  @override
  double getLastPrice() {
    return _stockPriceList.last.getCloseValue();
  }
}