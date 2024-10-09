import 'package:flutter/material.dart';
import 'package:medicos_jwt/model/medico_model.dart';
import 'package:medicos_jwt/model/usuario_model.dart';

class LoginController {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController storage = TextEditingController();
  UsuarioModel usuarioModel = UsuarioModel();

  Future<bool> logar() async {
    usuarioModel.email = email.text;
    usuarioModel.setSenha(senha.text);
   // Obterndo o token:
   String? token = await usuarioModel.logar();
   print(token); // apagar depois

   return token != '';
  }
}