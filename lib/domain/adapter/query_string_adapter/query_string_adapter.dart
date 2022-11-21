abstract class QueryStringAdapter {
  String fromMap(Map<String, String> query);
  Map<String, dynamic> parse(String queryString);
}