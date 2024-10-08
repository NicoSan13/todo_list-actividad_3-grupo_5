import 'package:flutter/material.dart';
import '../home/home_view.dart';

Future<void> signInWithEmailPassword(
    BuildContext context, String email, String password) async {
  const String correctEmail = 'prueba@utm.edu.ec';
  const String correctPassword = 'prueba123';

  if (email == correctEmail && password == correctPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('¡Ha iniciado sesión!')),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  } else if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingrese todos los campos')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Credenciales incorrectas')),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff4568dc),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.lock_outline,
                size: 100,
                color: Color(0xff4568dc),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                controller: emailController,
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  signInWithEmailPassword(
                      context, emailController.text, passwordController.text);
                  emailController.clear();
                  passwordController.clear();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff4568dc),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 15.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
