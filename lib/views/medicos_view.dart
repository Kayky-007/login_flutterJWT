import 'package:flutter/material.dart';
import 'package:medicos_jwt/controller/medicos_controller.dart';
import 'package:medicos_jwt/model/medico_model.dart';

class MedicosView extends StatefulWidget {
  const MedicosView({super.key});

  @override
  State<MedicosView> createState() => _MedicosViewState();
}

class _MedicosViewState extends State<MedicosView> {
  MedicosController _controller = MedicosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: FutureBuilder<List<Dados>?>(
        future: _controller.obterDadosMedicos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
             
             return Text('Nome: ${snapshot.data![index].nome}');
              
            },
          );
        },
      ),
    );
  }
}
