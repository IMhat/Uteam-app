import 'package:app_uteam/providers/login_form_provider.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:app_uteam/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const SizedBox(height: 250),
          CardContainer(
            child: Column(children: [
              const SizedBox(height: 10),
              Text('UTEAM', style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ]),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("No tienes cuenta?"),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'register'),
                child: const Text(
                  'Registrate',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ))),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Uteam@gmail.com',
                  labelText: 'Email',
                  prefixIcon: Icons.email_outlined),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese un mail valido';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '******',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_rounded),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe tener al menos 6 caracteres';
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 90),
              child: TextButton(
                  onPressed: () {},
                  child: const Text("olvidaste la contraseña?")),
            ),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: AlignmentDirectional.topEnd,
                          colors: [
                            Color.fromARGB(255, 242, 133, 157),
                            Color.fromARGB(255, 167, 79, 211),
                          ]),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: const Text(
                      'Iniciar Sesion',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                onPressed: () {
                  if (!loginForm.isValidForm()) return;
                  Navigator.pushReplacementNamed(context, 'home2');
                })
          ],
        ));
  }
}
