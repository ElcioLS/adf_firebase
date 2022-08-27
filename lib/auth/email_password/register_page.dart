import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    final userCredencial =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailEC.text,
      password: passwordEC.text,
    );

    userCredencial.user?.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuário '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: emailEC,
                decoration: const InputDecoration(
                  label: Text('e-mail'),
                ),
              ),
              TextField(
                controller: passwordEC,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              ElevatedButton(
                  onPressed: registerUser,
                  child: const Text('Cadastrar Usuário'))
            ],
          ),
        ),
      ),
    );
  }
}
