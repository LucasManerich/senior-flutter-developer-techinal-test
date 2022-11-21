import 'package:senior_flutter_developer_test/domain/adapter/http_request_adapter/http_request_adapter.dart';
import 'package:senior_flutter_developer_test/infra/adapter/dio_adapter/dio_adapter.dart';

class MakeDioAdapter {
  static HttpRequestAdapter make() {
    return DioAdapter();
  }
}