import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioModel {
  String? email;
  String? nome;
  String? _senha;

  void setSenha(String senha) {
    _senha = senha;
  }

  Future<String?> logar() async {
   
      final response = await http.post(
        Uri.parse('http://pin0581814w10-1.senacsp.edu.br:3010/login'),
        body: jsonEncode({'email': email, 'senha': _senha}),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> resposta = jsonDecode(response.body);

        if (resposta.containsKey('token')) {
          return resposta['token'] as String?;
        } else {
          throw Exception('Erro no token');
        }
      } else {
        throw Exception('Falha ao realizar login');
      }
   
  }
}
