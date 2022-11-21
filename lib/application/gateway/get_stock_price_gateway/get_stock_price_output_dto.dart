import 'package:senior_flutter_developer_test/application/gateway/get_stock_price_gateway/get_stock_price_output_price_item_dto.dart';

class GetStockPriceOutputDto {
  final String ticker;
  final String currency;
  final List<GetStockPriceOutputPriceItemDto> values;

  GetStockPriceOutputDto({
    required this.values,
    required this.currency,
    required this.ticker,
  });
}