import 'package:senior_flutter_developer_test/domain/enum/price_variation_type.dart';

abstract class StockPriceVariation {
  double getVariationPercentage();
  PriceVariationType getPriceVariationType();
}
