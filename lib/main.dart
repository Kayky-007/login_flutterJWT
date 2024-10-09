import 'package:flutter/material.dart';
import 'package:medicos_jwt/views/login_view.dart';
import 'package:medicos_jwt/views/medicos_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/medicos': (context) => const MedicosView(),
        '/login': (context) => const LoginView(),
      },
      initialRoute: '/login',
      // O home foi removido, pois estamos usando rotas
      title: 'Médicos JWT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
