import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:gotraining/modules/calendar/models/calendar_model.dart';
import 'package:gotraining/modules/calendar/stores/calendar_stores.dart';
import 'package:gotraining/modules/solicitados/widgets/card_grey_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/checkout_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/conteudo_menu.dart';
import 'package:gotraining/modules/solicitados/widgets/flotingacitonbutton_widget.dart';
import 'package:gotraining/modules/solicitados/widgets/header_solicitado.dart';
import 'package:gotraining/modules/solicitados/widgets/scroll_titulo_widget.dart';

import 'package:provider/provider.dart';

class SolicitadoPage extends StatefulWidget {
  final String loja;
  final String calendario;
  final String timeInicio;
  final String timeTermino;
  final String local;
  final String tema;
  final String treinamento;
  final int index;
  String check;

  SolicitadoPage({
    Key? key,
    required this.loja,
    required this.calendario,
    required this.timeInicio,
    required this.timeTermino,
    required this.local,
    required this.tema,
    required this.treinamento,
    required this.check,
    required this.index,
  });

  @override
  State<SolicitadoPage> createState() => _TestePageState();
}

class _TestePageState extends State<SolicitadoPage> {
  @override
  Widget build(BuildContext context) {
    final storeCalendar = Provider.of<AgendamentoStore>(context);
    final eventos = storeCalendar.eventos;
    final evento = widget.index >= 0 && widget.index < eventos.length
        ? eventos[widget.index]
        : null;

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          const HeaderSolicitadoWidget(),
          Positioned(
            top: 80,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        widget.loja,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Text(
                        "${widget.calendario} - ${widget.timeInicio} às ${widget.timeTermino}",
                      ),
                    ),
                    CardGreyWidget(
                      local: widget.local,
                      tema: widget.tema,
                      treinamento: widget.treinamento,
                    ),
                    const ScrollTitulo(),
                    ConteudoMenu(
                      check: widget.check,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ]),
            ),
          ),
        ]),
      ),
      floatingActionButton: widget.check == "a"
          ? FloatingActionButton(
              backgroundColor: ColorsApp.colorItem,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Iniciar Treinamento'),
                      content: const Text(
                          'Deseja confirmar o início do treinamento nesta data e horário?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('CANCELAR'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              widget.check = "b";
                            });
                            if (evento != null) {
                              storeCalendar.editarEvento(
                                  storeCalendar, evento, widget.check);
                            }

                            // localizacao
                            Navigator.of(context).pop();
                          },
                          child: const Text('CONFIRMAR'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.location_on),
            )
          : widget.check == "b"
              ? FlotingActionButtonCustom(
                  onpressed: () {
                    setState(() {
                      widget.check = "c";
                    });
                    if (evento != null) {
                      storeCalendar.editarEvento(
                          storeCalendar, evento, widget.check);
                    }
                    Navigator.of(context).pop();
                  },
                )
              : const Checkout(),
    );
  }
}
