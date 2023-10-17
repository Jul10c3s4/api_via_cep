import 'dart:convert';
import 'package:api_via_cep/models/cep_model.dart';
import 'package:api_via_cep/pages/list_cep_page.dart';
import 'package:api_via_cep/repositories/cep/cep_dio_repository.dart';
import 'package:api_via_cep/repositories/via_cep/via_cep_dio_repository.dart';
import 'package:api_via_cep/shared/cep-card.dart';
import 'package:api_via_cep/shared/custom_buttom.dart';
import 'package:api_via_cep/shared/custom_text.dart';
import 'package:api_via_cep/shared/custom_textfield.dart';
import 'package:flutter/material.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final TextEditingController _cepController = TextEditingController();
  bool load = false;
  CepsModel cepsModel = CepsModel();
  CepDioRepository cepDioRepository = CepDioRepository();
  ViaCepDioRepository viaCepDioRepository = ViaCepDioRepository();
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

  void consultarCep() async {
    try {
      if (_cepController.text.length == 8) {
        _cepController.text.replaceAll(RegExp(r'^0-9'), '');
        var result = cepsModel.results.where((cep) =>
            cep.cep.replaceAll(RegExp(r'[^0-9]'), '') == _cepController.text);
        load = true;
        setState(() {});
        print(result.length);
        if (result.isEmpty) {
          var newCep =
              await viaCepDioRepository.consultarCep(_cepController.text);
          print(newCep.toJson());
          cepDioRepository.createCep(newCep);
          getData();
        } else {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: CustomTitle.buildTitle(context,
                      "Esse cep já está cadastrado verifique os ceps salvos"),
                  actions: [
                    TextButton(
                        child: CustomTitle.buildOkTitle(context, "ok"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                );
              });
        }
        load = false;
        _cepController.text = "";
        setState(() {});
      } else {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: CustomTitle.buildTitle(context,
                    "Digite 8 números para verificar o cep informado!"),
                actions: [
                  TextButton(
                      child: CustomTitle.buildOkTitle(context, "ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              );
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: CustomTitle.buildTitle(
                  context, "O cep informado é inválido!"),
              actions: [
                TextButton(
                    child: CustomTitle.buildOkTitle(context, "ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
      load = false;
      setState(() {});
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: CustomTitle.buildMainTitle(context, "Consultor de ceps"),
        ),
        // drawer: const DrawerComponent(),
        body: load
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox()),
                    CustomTextField(
                        inputType: TextInputType.number,
                        maxLength: 8,
                        controller: _cepController,
                        hintText: "57319100",
                        title: "Informe o cep: "),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButtom(
                          title: CustomTitle.buildTitleButton(
                              context, "Consultar"),
                          color: Colors.green,
                          onPressed: consultarCep),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Visibility(
                        visible: load,
                        child: const CircularProgressIndicator()),
                    const SizedBox(
                      height: 5,
                    ),
                    cepsModel.results.isNotEmpty
                        ? CepCard(
                            cep: cepsModel.results.last,
                            delete: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: CustomTitle.buildTitle(context,
                                          "Tem certeza que deseja excluir o cep ${cepsModel.results.last.cep}"),
                                      actions: [
                                        TextButton(
                                            child: CustomTitle.buildCancelTitle(
                                                context, "Cancelar"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        TextButton(
                                            child: CustomTitle.buildOkTitle(
                                                context, "Ok"),
                                            onPressed: () {
                                              cepDioRepository.delete(cepsModel
                                                  .results.first.objectId);
                                              Navigator.pop(context);
                                              getData();
                                            }),
                                      ],
                                    );
                                  });
                            },
                          )
                        : const SizedBox(),
                    const Expanded(child: SizedBox()),
                    Visibility(
                        visible: cepsModel.results.isNotEmpty,
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButtom(
                              title: CustomTitle.buildTitleButton(
                                  context, "Ver Ceps"),
                              color: Colors.green,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ListCepPage()));
                              }),
                        )),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
