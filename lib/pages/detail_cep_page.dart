import 'package:api_via_cep/models/cep_model.dart';
import 'package:api_via_cep/repositories/cep/cep_dio_repository.dart';
import 'package:api_via_cep/shared/custom_text.dart';
import 'package:api_via_cep/shared/custom_textfield.dart';
import 'package:flutter/material.dart';

class DetailCepPage extends StatefulWidget {
  Results results;
  DetailCepPage({super.key, required this.results});

  @override
  State<DetailCepPage> createState() => _DetailCepPageState();
}

class _DetailCepPageState extends State<DetailCepPage> {
  final TextEditingController _updateControler = TextEditingController();
  CepDioRepository cepDioRepository = CepDioRepository();
  @override
  void click(Function click) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: CustomTitle.buildTitle(context, ""),
            content: CustomTextField(
                controller: _updateControler,
                hintText: "",
                title: "insira a nova informação: "),
            actions: [
              TextButton(
                  child: CustomTitle.buildCancelTitle(context, "Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: CustomTitle.buildOkTitle(context, "Ok"),
                  onPressed: () {
                    if (_updateControler.text != "") {
                      click();
                      cepDioRepository.update(widget.results);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: CustomTitle.buildTitle(context,
                                  "O campo está vazio!, digite algo para alterar o valor"),
                              actions: [
                                TextButton(
                                    child:
                                        CustomTitle.buildOkTitle(context, "Ok"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          });
                    }
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: CustomTitle.buildTitle(
            context, "Dados do cep ${widget.results.cep}"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          children: [
            const Icon(
              Icons.location_on,
              size: 120,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CustomTitle.buildOkTitle(
                  context, "Clique nos dados para altera-los!"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "Cep: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitle(context, widget.results.cep),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "logradouro: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(
                    context, widget.results.logradouro, () {
                  return click(
                      () => widget.results.logradouro = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "complemento: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(
                    context, widget.results.complemento, () {
                  return click(
                      () => widget.results.complemento = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "Bairro: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(context, widget.results.cep, () {
                  return click(
                      () => widget.results.bairro = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "localidade: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(
                    context, widget.results.localidade, () {
                  return click(
                      () => widget.results.localidade = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "uf: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(context, widget.results.uf, () {
                  return click(() => widget.results.uf = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "ibge: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(context, widget.results.ibge,
                    () {
                  return click(
                      () => widget.results.ibge = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "gia: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(context, widget.results.gia, () {
                  return click(
                      () => widget.results.gia = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "ddd: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(context, widget.results.ddd, () {
                  return click(
                      () => widget.results.ddd = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTitle.buildTitle(context, "siafi: "),
                const SizedBox(
                  width: 3,
                ),
                CustomTitle.buildSubTitleClick(context, widget.results.siafi,
                    () {
                  return click(
                      () => widget.results.siafi = _updateControler.text);
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
    ));
  }
}
