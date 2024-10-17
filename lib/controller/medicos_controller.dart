import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicos_jwt/model/medico_model.dart';

class MedicosController {
  String? token;
  FlutterSecureStorage storage = FlutterSecureStorage();
 
  Future<List<Dados>?>? obterDadosMedicos() async {
    token = await storage.read(key: 'token');
        MedicosModal medicosModal = await MedicosModal.dadosMedicos(token);

      await storage.write(key: 'token', value: medicosModal.token);
    
    
    return medicosModal.dados;
  }
}
