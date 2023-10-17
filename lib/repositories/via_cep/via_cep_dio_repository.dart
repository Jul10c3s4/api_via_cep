import 'package:api_via_cep/models/cep_model.dart';
import 'package:dio/dio.dart';

class ViaCepDioRepository {
  final _dio = Dio();
  Future<Results> consultarCep(String cep) async {
    var results = await _dio.get("https://viacep.com.br/ws/$cep/json/");

    if (results.statusCode == 200) {
      return Results.fromJsonViaCep(results.data);
    }
    return Results();
  }
}
