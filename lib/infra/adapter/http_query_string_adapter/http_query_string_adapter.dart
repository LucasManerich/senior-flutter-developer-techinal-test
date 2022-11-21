import 'package:http_query_string/http_query_string.dart';
import 'package:senior_flutter_developer_test/domain/adapter/query_string_adapter/query_string_adapter.dart';

class HttpQueryStringAdapter implements QueryStringAdapter {
  @override
  String fromMap(Map<String, String> query) {
    return Encoder().convert(query);
  }

  @override
  Map<String, dynamic> parse(String queryString) {
    return Decoder().convert(queryString);
  }
}