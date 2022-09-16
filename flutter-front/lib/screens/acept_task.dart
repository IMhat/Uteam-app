import 'package:app_uteam/widgets/finish_task.dart';
import 'package:flutter/material.dart';

class AceptTask extends StatefulWidget {
  const AceptTask({Key? key}) : super(key: key);

  @override
  State<AceptTask> createState() => _AceptTaskState();
}

class _AceptTaskState extends State<AceptTask> {
  final elevatedButtonStyle = ElevatedButton.styleFrom(
      shadowColor: const Color.fromARGB(255, 54, 57, 244),
      elevation: 10,
      primary: Colors.deepPurple,
      onPrimary: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Detalle del desafío"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      colors: [
                        Color.fromARGB(255, 242, 133, 157),
                        Color.fromARGB(255, 167, 79, 211)
                      ]),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "¡Haz aceptado el desafío!",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(top: 5),
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      colors: [
                        Color.fromARGB(255, 242, 133, 157),
                        Color.fromARGB(255, 167, 79, 211)
                      ]),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Título",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      colors: [
                        Color.fromARGB(255, 242, 133, 157),
                        Color.fromARGB(255, 167, 79, 211)
                      ]),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Descripción",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      colors: [
                        Color.fromARGB(255, 242, 133, 157),
                        Color.fromARGB(255, 167, 79, 211)
                      ]),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Text(
                  "Puntos",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 208, 93, 93),
                width: 400,
                height: 150,
                child: const FinishTask(),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: 400,
                height: 100,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Comentarios',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: 400,
                height: 100,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Comentarios',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: 400,
                height: 100,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Comentarios',
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
