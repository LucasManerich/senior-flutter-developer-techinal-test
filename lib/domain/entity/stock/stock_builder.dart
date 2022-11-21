import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock_impl.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price.dart';

class StockBuilder {
  String? _ticker;
  String? _shortName;
  String? _longName;
  List<StockPrice>? _stockPriceList;

  StockBuilder setTicker(String ticker) {
    _ticker = ticker;
    return this;
  }

  StockBuilder setShortName(String shortName) {
    _shortName = shortName;
    return this;
  }
  
  StockBuilder setLongName(String longName) {
    _longName = longName;
    return this;
  }
    
  StockBuilder setStockPriceList(List<StockPrice> stockPriceList) {
    _stockPriceList = stockPriceList;
    return this;
  }

  String _getTicker() {
    if(_ticker == null) throw ('StockBuilder: ticker not set');
    return _ticker!;
  }

  String _getShortName() {
    if(_shortName == null) throw ('StockBuilder: shortName not set');
    return _shortName!;
  }

  String _getLongName() {
    if(_longName == null) throw ('StockBuilder: longName not set');
    return _longName!;
  }

  List<StockPrice> _getStockPriceList() {
    if(_stockPriceList == null) throw ('StockBuilder: stockPriceList not set');
    return _stockPriceList!;
  }

  Stock build() {
    return StockImpl(_getTicker(), _getShortName(), _getLongName(), _getStockPriceList());
  }
}