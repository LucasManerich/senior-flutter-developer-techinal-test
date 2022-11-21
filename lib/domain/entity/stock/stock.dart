import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price_variation.dart';

abstract class Stock {
  String getTicker();
  String getLongName();
  String getShortName();
  List<StockPrice> getStockPrice();
  StockPriceVariation getPriceVariation();
  double getLastPrice();
}
