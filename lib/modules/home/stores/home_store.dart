import 'package:flutter/material.dart';
import 'package:gotraining/modules/calendar/pages/calendar_page.dart';
import 'package:gotraining/modules/home/pages/home_page.dart';
import 'package:gotraining/modules/motivometro/pages/motivometro_page.dart';
import 'package:gotraining/modules/reembolso/pages/reembolso_page.dart';
import 'package:intl/intl.dart';

class HomeStore extends ChangeNotifier {
  DateTime horarioAtual = DateTime.now();
  final DateFormat horarioFormatando = DateFormat('dd MMM yyyy', "pt_BR");

  DateTime mesAtual = DateTime.now();
  DateFormat mesFormatando = DateFormat('MMM yyyy', "pt_BR");

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  int currentIndex = 0;

  final tabs = [
    const HomePageItem(),
    const CalendarPage(),
    const ReembolsoPage(),
    const MotivoMetroPage(),
  ];
  onItemTapped(int index) {
    if (index == 4) {
      drawerKey.currentState?.openDrawer();
    } else {
      currentIndex = index;
      notifyListeners();
    }
  }
}
