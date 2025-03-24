import 'package:flutter/material.dart';
import 'package:timer_alura/screens/tela_inicial.dart';
import 'package:timer_alura/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temporizador',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const TelaInicial(),
    );
  }
}
