import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicosModal {
// return MedicosModal.fromJson(jsonDecode(response.body)as Map<String, dynamic>);

  
 
  String? token;
  List<Dados>? dados;

  MedicosModal({this.token, this.dados});

  MedicosModal.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    if (json['dados'] != null) {
      dados = <Dados>[];
      json['dados'].forEach((v) {
        dados!.add(new Dados.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.dados != null) {
      data['dados'] = this.dados!.map((v) => v.toJson()).toList();
    }
    return data;
  }
   static Future<MedicosModal> dadosMedicos(token) async {
  final response = await http.get(
        Uri.parse('http://pin0581814w10-1.senacsp.edu.br:3010/medicos'),
        headers: {"Authorization": token },
      );

      
    

       if (response.statusCode == 200) {
       return MedicosModal.fromJson(jsonDecode(response.body)as Map<String, dynamic>);

      } else {
        throw Exception('Falha ao realizar login');
      }

   }
}

class Dados {
  int? id;
  String? nome;
  String? telefone;
  String? especialidade;
  String? fotoUrl;

  Dados({this.id, this.nome, this.telefone, this.especialidade, this.fotoUrl});

  Dados.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    telefone = json['telefone'];
    especialidade = json['especialidade'];
    fotoUrl = json['fotoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['especialidade'] = this.especialidade;
    data['fotoUrl'] = this.fotoUrl;
    return data;
  }
}