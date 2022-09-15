import 'package:flutter/material.dart';

class FinishTask extends StatefulWidget {
  const FinishTask({Key? key}) : super(key: key);

  @override
  State<FinishTask> createState() => _FinishTaskState();
}

class _FinishTaskState extends State<FinishTask> {
  TextEditingController tituloController = TextEditingController();
  bool titulo = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                SwitchListTile(
                    title: const Text("¿Está completo?"),
                    value: titulo,
                    onChanged: (bool? value) {
                      if (value != null) {
                        titulo = value;
                        setState(() {});
                      }
                    }),
                if (titulo)
                  MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Map<String, dynamic> infoTask = {
                          'titulo': tituloController.text,
                          if (titulo) 'titulo-tarea': tituloController.text,
                        };
                        print(infoTask);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: AlignmentDirectional.topEnd,
                              colors: [
                                Color.fromARGB(255, 242, 133, 157),
                                Color.fromARGB(255, 167, 79, 211)
                              ]),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          "Finalizar desafío",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  )
              ],
            )),
      ),
    );
  }
}
