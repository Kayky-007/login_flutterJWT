import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MedicosView extends StatefulWidget {
  const MedicosView({super.key});

  @override
  State<MedicosView> createState() => _MedicosViewState();
}

class _MedicosViewState extends State<MedicosView> {
  final storage = FlutterSecureStorage(); 
  Future<String?>? teste;

  // Obter dados:
  Future<String?> obterDados() async {
    return await storage.read(key: 'mensagem');
  }

  @override
  void initState() { 
    super.initState();
    teste = obterDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicos JWT'),
      ),
      body: FutureBuilder(
        future: teste,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); 
          } else {
            return Text(snapshot.data ?? 'nada');
          }
        },
      ),
    );
  }
}
