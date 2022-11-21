import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price.dart';

class StockPriceImpl implements StockPrice {
  final DateTime _date;
  final double _openValue;
  final double _closeValue;
  final double _highValue;
  final double _lowValue;
  final double _volume;

  StockPriceImpl(
    this._date,
    this._openValue,
    this._closeValue,
    this._highValue,
    this._lowValue,
    this._volume
  );

  @override
  double getCloseValue() {
    return _closeValue;
  }

  @override
  DateTime getDate() {
    return _date;
  }

  @override
  double getHighValue() {
    return _highValue;
  }

  @override
  double getLowValue() {
    return _lowValue;
  }

  @override
  double getOpenValue() {
    return _openValue;
  }

  @override
  double getVolume() {
    return _volume;
  }
}