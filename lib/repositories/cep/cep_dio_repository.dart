import 'package:api_via_cep/models/cep_model.dart';
import 'package:api_via_cep/repositories/cep/cep_custom_dio.dart';

class CepDioRepository {
  var customDio = CepCustomDio();

  getData() async {
    var result = await customDio.dio.get("");
    if (result.statusCode == 200) {
      return CepsModel.fromJson(result.data);
    }
    return CepsModel();
  }

  void createCep(Results cep) async {
    try {
      await customDio.dio.post("", data: cep.toJson());
    } catch (e) {
      print(e);
    }
  }

  void update(Results cep) async {
    await customDio.dio.put("/${cep.objectId}", data: cep.toJson());
  }

  void delete(String id) async {
    await customDio.dio.delete("/$id");
  }
}
