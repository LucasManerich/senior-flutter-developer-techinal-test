import 'package:senior_flutter_developer_test/domain/adapter/http_request_adapter/http_request_adapter.dart';
import 'package:flutter/material.dart';

abstract class YahooFinanceGateway {
  static const baseUrl = 'https://query2.finance.yahoo.com';
  final HttpRequestAdapter _httpRequestAdapter;

  YahooFinanceGateway(this._httpRequestAdapter);

  @protected
  Future<dynamic> callApi(String path) async {
    final String url = baseUrl + path;
    return await _httpRequestAdapter.callGet(url);
  }
}