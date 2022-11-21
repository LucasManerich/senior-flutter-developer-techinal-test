import 'package:senior_flutter_developer_test/application/gateway/get_stock_info_gateway/get_stock_info_output_dto.dart';

abstract class GetStockInfoGateway {
  Future<GetStockInfoOutputDto> perform(String ticker);
}