abstract class HttpRequestAdapter {
  Future<dynamic> callGet(String url);
  Future<dynamic> calPost(String url, { dynamic data });
  Future<dynamic> callPut(String url, { dynamic data });
  Future<dynamic> callDelete(String url);
}