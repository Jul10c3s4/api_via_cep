import 'package:api_via_cep/models/cep_model.dart';
import 'package:api_via_cep/shared/custom_text.dart';
import 'package:flutter/material.dart';

class DetailCepPage extends StatefulWidget {
  Results results;
  DetailCepPage({super.key, required this.results});

  @override
  State<DetailCepPage> createState() => _DetailCepPageState();
}

class _DetailCepPageState extends State<DetailCepPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomTitle.buildMainTitle(
              context, "Dados do cep ${widget.results.cep}"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              const Icon(
                Icons.location_on,
                size: 120,
                color: Colors.red,
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
                  CustomTitle.buildSubTitle(context, widget.results.logradouro),
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
                  CustomTitle.buildSubTitle(
                      context, widget.results.complemento),
                ],
              ),
              const SizedBox(
                height: 10,
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
                  CustomTitle.buildTitle(context, "localidade: "),
                  const SizedBox(
                    width: 3,
                  ),
                  CustomTitle.buildSubTitle(context, widget.results.localidade),
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
                  CustomTitle.buildSubTitle(context, widget.results.uf),
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
                  CustomTitle.buildSubTitle(context, widget.results.ibge),
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
                  CustomTitle.buildSubTitle(context, widget.results.gia),
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
                  CustomTitle.buildSubTitle(context, widget.results.ddd),
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
                  CustomTitle.buildSubTitle(context, widget.results.siafi),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
