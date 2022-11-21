import 'package:senior_flutter_developer_test/domain/adapter/http_request_adapter/http_request_adapter.dart';
import 'package:senior_flutter_developer_test/infra/adapter/http_query_string_adapter/http_query_string_adapter.dart';
import 'package:senior_flutter_developer_test/domain/adapter/query_string_adapter/query_string_adapter.dart';

class MakeHttpQueryStringAdapter {
  static QueryStringAdapter make() {
    return HttpQueryStringAdapter();
  }
}