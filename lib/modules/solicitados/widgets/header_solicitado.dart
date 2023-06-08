import 'package:flutter/material.dart';
import 'package:gotraining/modules/solicitados/stores/dados_card_store.dart';
import 'package:provider/provider.dart';

class HeaderSolicitadoWidget extends StatelessWidget {
  const HeaderSolicitadoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dadosStore = Provider.of<SolicitadosStore>(context);
    return Container(
      height: 105,
      color: Colors.black,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              width: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  dadosStore.activePage = 0;
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
          const Text(
            "Solicitado",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      )),
    );
  }
}
