import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock_price/stock_price_variation.dart';
import 'package:senior_flutter_developer_test/domain/enum/price_variation_type.dart';

class StockPriceVariationMediator implements StockPriceVariation {
  final List<StockPrice> _stockPriceList;

  StockPriceVariationMediator(this._stockPriceList);

  @override
  double getVariationPercentage() {
    StockPrice firstItem = _stockPriceList.first;
    StockPrice lastItem = _stockPriceList.last;

    return (lastItem.getCloseValue() / firstItem.getCloseValue()) - 1;
  }

  @override
  PriceVariationType getPriceVariationType() {
    double percentVariation = getVariationPercentage();
    if(percentVariation.isNegative) return PriceVariationType.negative;
    return PriceVariationType.positive;
  }
}