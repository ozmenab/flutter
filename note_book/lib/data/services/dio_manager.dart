import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioManager {
  late Dio dio;

  static const String _baseUrl = 'localhost/';

  DioManager() {
    dio = Dio(
      BaseOptions(baseUrl: _baseUrl),
    );
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}
