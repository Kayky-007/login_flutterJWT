import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicos_jwt/model/medico_model.dart';
class MedicosController {
  String? token;
FlutterSecureStorage storage = FlutterSecureStorage();


Future<void> obterDadosMedicos() async {
  MedicosModal medicosModal = await MedicosModal.dadosMedicos(token);
  token = medicosModal.token;
  await storage.write(key: 'token', value: token );
  print(token);

  
  
  }






// Future<MedicosModal> obterDadosMedicos() async {

    
//    token = await storage.read(key: 'token');
//     // Acessa o token
    
//     print("Token: $token");

//     List<Dados>? listaDeMedicos = medicos.dados;

//     if (listaDeMedicos != '') {
//         print("Nome: ${listaDeMedicos![0].nome}");
//         print("Telefone: ${listaDeMedicos![0].telefone}");
//         print("Especialidade: ${listaDeMedicos![0].especialidade}");
//         print("Foto URL: ${listaDeMedicos[0].fotoUrl}");
//     } else {
//       print("Nada encontrado");
//     }

// }

}