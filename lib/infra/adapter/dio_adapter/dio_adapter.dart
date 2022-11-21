import 'package:senior_flutter_developer_test/domain/adapter/http_request_adapter/http_request_adapter.dart';
import 'package:dio/dio.dart';

class DioAdapter implements HttpRequestAdapter {
  final dio = Dio();
  
  @override
  Future<dynamic> callGet(String url) async {
    final response = await dio.get(url, options:  Options(responseType: ResponseType.json));
    return response.data;
  }

  @override
  Future<dynamic> calPost(String url, { dynamic data }) async {
    final response = await dio.post(url, data: data, options: Options(responseType: ResponseType.json));
    return response.data;
  }

  @override
  Future<dynamic> callPut(String url, { dynamic data }) async {
    final response = await dio.post(url, data: data, options: Options(responseType: ResponseType.json));
    return response.data;
  }

  @override
  Future<dynamic> callDelete(String url) async {
    final response = await dio.post(url, options: Options(responseType: ResponseType.json));
    return response.data;
  }
}