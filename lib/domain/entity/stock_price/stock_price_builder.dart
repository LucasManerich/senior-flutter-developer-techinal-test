import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price_impl.dart';

class StockPriceBuilder {
  DateTime? _date;
  double? _openValue;
  double? _closeValue;
  double? _highValue;
  double? _lowValue;
  double? _volume;

  StockPriceBuilder setDate(DateTime date) {
    _date = date;
    return this;
  }

  StockPriceBuilder setOpenValue(double openValue) {
    _openValue = openValue;
    return this;
  }

  StockPriceBuilder setCloseValue(double closeValue) {
    _closeValue = closeValue;
    return this;
  }

  StockPriceBuilder setHighValue(double highValue) {
    _highValue = highValue;
    return this;
  }

  StockPriceBuilder setLowValue(double lowValue) {
    _lowValue = lowValue;
    return this;
  }

  StockPriceBuilder setVolume(double volume) {
    _volume = volume;
    return this;
  }

  DateTime _getDate() {
    if(_date == null) throw ('StockPriceBuilder: date not set');
    return _date!;
  }

  double _getOpenValue() {
    if(_openValue == null) throw ('StockPriceBuilder: open value not set');
    return _openValue!;
  }

  double _getCloseValue() {
    if(_closeValue == null) throw ('StockPriceBuilder: close value not set');
    return _closeValue!;
  }

  double _getHighValue() {
    if(_highValue == null) throw ('StockPriceBuilder: high value not set');
    return _highValue!;
  }

  double _getLowValue() {
    if(_lowValue == null) throw ('StockPriceBuilder: low value not set');
    return _lowValue!;
  }

  double _getVolume() {
    if(_volume == null) throw ('StockPriceBuilder: volume not set');
    return _volume!;
  }


  StockPrice build() {
    return StockPriceImpl(_getDate(), _getOpenValue(), _getCloseValue(), _getHighValue(), _getLowValue(), _getVolume());
  }
}