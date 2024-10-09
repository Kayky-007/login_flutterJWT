import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicos_jwt/controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
  
}

class _LoginViewState extends State<LoginView> {
  LoginController _controller = LoginController();
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller.email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _controller.senha,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            ElevatedButton(
              onPressed: () async{
                if(await _controller.logar()) {
                  // redirecionar o usuario
                  Navigator.of(context).pushReplacementNamed('/medicos');
                }else{
                 SnackBar(
                   content: Text('Usuario ou senha inválidos'),
                 );
                  
                   
                }
              },
              child: const Text('Login'),       
            ),
          ],
        ),
      ),
    );
  }
}
