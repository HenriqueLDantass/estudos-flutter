import 'package:flutter/material.dart';
import 'package:gotraining/modules/solicitados/widgets/card_participantes_com_modal.dart';
import 'package:gotraining/modules/solicitados/widgets/card_participantes_widget.dart';

class SolicitadoScreen extends StatefulWidget {
  final String check;
  const SolicitadoScreen({super.key, required this.check});

  @override
  State<SolicitadoScreen> createState() => _SolicitadoScreenState();
}

class _SolicitadoScreenState extends State<SolicitadoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("0 Realizado"),
              Text("0 Previsto"),
              Text("0 Limite"),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Text('Cadastre os participantes'),
            ),
            widget.check == "a"
                ? const CardParticipantesComModalWidget()
                : const CardParticipantesWidget()

            //CardPrticipantesWidget(),
          ],
        ),
      ],
    );
  }
}
