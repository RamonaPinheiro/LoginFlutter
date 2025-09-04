import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Perfil.dart';

class Login {
  String usuario;
  String senha;

  Login({required this.usuario, required this.senha});

  bool autenticar(String usuarioDigitado, String senhaDigitada) {
    return usuarioDigitado == usuario && senhaDigitada == senha;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  final Login login = Login(usuario: "admin", senha: "1234");

  void _fazerLogin() {
    String usuario = usuarioController.text;
    String senha = senhaController.text;

    bool sucesso = login.autenticar(usuario, senha);

    if (sucesso) {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Perfil()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("❌ Usuário ou senha incorretos."),
          backgroundColor: Color.fromARGB(255, 223, 20, 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fazerLogin,
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}