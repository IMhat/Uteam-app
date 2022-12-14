import 'package:app_uteam/providers/login_form_provider.dart';
import 'package:app_uteam/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100),
              width: 200,
              height: 100,
              color: Colors.white,
              child: Image.asset("assets/logouteam.png")),
          Container(
            margin: const EdgeInsets.only(top: 70),
            width: 250,
            height: 80,
            color: Colors.white,
            child: const Text(
              "Crea tu cuenta para ganar puntos",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff5D4FB1)),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            width: 250,
            height: 80,
            color: Colors.white,
            child: const Text(
              "Con la app podrás registrarte y obtener puntos",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff5D4FB1)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CardContainer(
            child: Column(children: [
              const SizedBox(height: 10),
              const SizedBox(height: 50),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _InitialScreenForm())
            ]),
          ),
        ],
      )),
    );
  }
}

class _InitialScreenForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  if (!loginForm.isValidForm()) return;
                  Navigator.pushReplacementNamed(context, 'register');
                }),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Color.fromARGB(255, 218, 179, 231),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Color(0xff5D4FB1),
                      ),
                    )),
                onPressed: () {
                  if (!loginForm.isValidForm()) return;
                  Navigator.pushReplacementNamed(context, 'login');
                })
          ],
        ));
  }
}
