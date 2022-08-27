import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print('Usuário logado?  ${user != null}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/auth/email_password/register');
                    },
                    child: const Text('Registro de Email e Senha')),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/auth/email_password/login');
                  },
                  child: const Text('Login com Email e Senha')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/auth/show_user');
                  },
                  child: const Text('Show User Logged'))
            ],
          ),
        ),
      ),
    );
  }
}
