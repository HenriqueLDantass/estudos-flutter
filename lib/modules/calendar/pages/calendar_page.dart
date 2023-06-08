import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';

import 'package:gotraining/modules/calendar/stores/calendar_stores.dart';
import 'package:gotraining/modules/calendar/widgets/calendar_item.dart';
import 'package:gotraining/modules/calendar/widgets/menu_buttom_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late CalendarStore store;

  @override
  void initState() {
    super.initState();
    store = CalendarStore();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha agenda'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
              availableCalendarFormats: const {
                CalendarFormat.month: 'Semana',
                CalendarFormat.week: 'Mês',
              },
              locale: 'pt_BR',
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              focusedDay: store.selectedDate,
              selectedDayPredicate: (day) {
                return isSameDay(store.selectedDate, day);
              },
              calendarFormat: store.isMonthFormat
                  ? CalendarFormat.month
                  : CalendarFormat.week,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(store.selectedDate, selectedDay)) {
                  setState(() {
                    store.selectedDate = selectedDay;
                  });
                  store.loadEventos();
                }
              },
              onFormatChanged: (format) {
                setState(() {
                  store.isMonthFormat = format == CalendarFormat.month;
                });
                store.loadEventos();
              }),
          Expanded(
            child: Consumer<AgendamentoStore>(
              builder: (context, store, _) {
                return ListView.builder(
                  itemCount: store.eventos.length,
                  itemBuilder: (context, index) {
                    final evento = store.eventos[index];
                    return CalendarItem(
                      timeInicio: evento.timeInicio,
                      local: evento.local,
                      timeTermino: evento.timeTermino,
                      loja: evento.loja,
                      treinamento: evento.treinamento,
                      tema: evento.tema,
                      index: index,
                      calendario: evento.calendario,
                      check: evento.checking,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const MenuButtom(),
    );
  }
}
