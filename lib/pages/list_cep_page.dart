import 'package:api_via_cep/models/cep_model.dart';
import 'package:api_via_cep/pages/cep_page.dart';
import 'package:api_via_cep/repositories/cep/cep_dio_repository.dart';
import 'package:api_via_cep/shared/cep-card.dart';
import 'package:api_via_cep/shared/custom_buttom.dart';
import 'package:api_via_cep/shared/custom_text.dart';
import 'package:flutter/material.dart';

class ListCepPage extends StatefulWidget {
  const ListCepPage({super.key});

  @override
  State<ListCepPage> createState() => _ListCepPageState();
}

class _ListCepPageState extends State<ListCepPage> {
  var load = false;
  CepsModel cepsModel = CepsModel();
  CepDioRepository cepDioRepository = CepDioRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    load = true;
    setState(() {});
    cepsModel = await cepDioRepository.getData();
    load = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
              icon: const Icon(Icons.close),
              iconSize: 30,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const CepPage()));
              }),
          title: CustomTitle.buildMainTitle(context, "Ceps cadastrados"),
        ),
        body: load
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: cepsModel.results.length,
                itemBuilder: (context, index) {
                  var cep = cepsModel.results[index];
                  return CepCard(
                    cep: cep,
                    delete: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: CustomTitle.buildTitle(context,
                                  "Tem certeza que deseja excluir o cep ${cep.cep}"),
                              actions: [
                                TextButton(
                                    child: CustomTitle.buildCancelTitle(
                                        context, "Cancelar"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                TextButton(
                                    child:
                                        CustomTitle.buildOkTitle(context, "Ok"),
                                    onPressed: () {
                                      cepDioRepository.delete(cep.objectId);
                                      getData();
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          });
                    },
                  );
                },
              ),
      ),
    );
  }
}
