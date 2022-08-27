import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final userCredencial =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailEC.text,
      password: passwordEC.text,
    );

    userCredencial.user?.sendEmailVerification();

    final user = userCredencial.user;
    String message = '';

    if (user != null && !user.emailVerified) {
      message = 'E-mail não confirmado, por favor verifique seu e-mail';
    } else {
      message = 'E-mail validado com sucesso';
    }

    await user?.updateDisplayName('Elcinho Lindo');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    print(userCredencial.user?.displayName);
    print(userCredencial.user?.email);
    print(userCredencial.user?.emailVerified);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login do usuário '),
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
                  onPressed: loginUser, child: const Text('Logar Usuário'))
            ],
          ),
        ),
      ),
    );
  }
}
