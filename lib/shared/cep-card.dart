import 'package:api_via_cep/models/cep_model.dart';
import 'package:api_via_cep/pages/detail_cep_page.dart';
import 'package:api_via_cep/shared/custom_text.dart';
import 'package:flutter/material.dart';

class CepCard extends StatelessWidget {
  Results cep;
  Function? update;
  Function delete;

  CepCard({super.key, required this.cep, this.update, required this.delete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailCepPage(results: cep)));
      },
      child: Card(
          shadowColor: Colors.black,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTitle.buildSubTitle(context, "Cep: ${cep.cep}"),
                        CustomTitle.buildSubTitle(
                            context, "Cidade: ${cep.localidade}"),
                        CustomTitle.buildSubTitle(
                            context, "Bairro: ${cep.bairro}"),
                      ],
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          delete();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 60,
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
