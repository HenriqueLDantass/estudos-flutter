import 'package:flutter/material.dart';

class ComentarioScreen extends StatelessWidget {
  const ComentarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Nenhum comentário.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
