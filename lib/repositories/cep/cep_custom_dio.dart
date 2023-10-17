import 'package:api_via_cep/repositories/cep/cep_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CepCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  CepCustomDio() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("APPBASEURL");
    _dio.interceptors.add(CepInterceptor());
  }
}
