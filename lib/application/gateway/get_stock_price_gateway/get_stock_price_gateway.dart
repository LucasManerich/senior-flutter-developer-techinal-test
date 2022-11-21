import 'package:senior_flutter_developer_test/application/gateway/get_stock_price_gateway/get_stock_price_output_dto.dart';
import 'package:senior_flutter_developer_test/domain/enum/granularity.dart';
import 'package:senior_flutter_developer_test/domain/enum/range.dart';

abstract class GetStockPriceGateway {
  Future<GetStockPriceOutputDto> perform(String ticker, { granularity = Granularity.day, range = Range.oneMonth });
}