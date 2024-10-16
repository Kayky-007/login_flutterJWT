import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:medicos_jwt/controller/medicos_controller.dart';

class MedicosView extends StatefulWidget {
  const MedicosView({super.key});

  @override
  State<MedicosView> createState() => _MedicosViewState();
}

class _MedicosViewState extends State<MedicosView> {
  MedicosController _controller = MedicosController();
  final storage = FlutterSecureStorage();

  // Future<String?>? teste;

  // Obter dados:
  Future<void> inicializador() async {
    _controller.token = await storage.read(key: 'token');
    // verificação se o token expirou
    if (_controller.token == '' || JwtDecoder.isExpired(_controller.token!)) {
      Navigator.of(context).pushReplacementNamed('/login');
    }
    print(_controller.token);
    print(JwtDecoder.isExpired(_controller.token!));
    print(JwtDecoder.decode(_controller.token!));
  }

  @override
  void initState() {
    super.initState();
    inicializador();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicos JWT'),
      ),

      body: Column(
        children: [
          Text('Clique abaixo:'),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _controller.obterDadosMedicos();
                    
                  },
                  child: Text('Procurar')),
            ],
          ),
          Row(
            children: [
              Card(
                elevation: 5, // Sombra
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:  Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Nome: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Telefone: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Especialidade: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Image.network('http://pin0581814w10-1.senacsp.edu.br:3010/imagens/600.jpg',
                      width: 200,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),

      // body: FutureBuilder(

      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const CircularProgressIndicator();
      //     } else {
      //       return Text(snapshot.data ?? 'nada');
      //     }
      //   },
      // ),
    );
  }
}
