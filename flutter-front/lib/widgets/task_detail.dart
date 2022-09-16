import 'package:flutter/material.dart';

class MyTaskDetail extends StatefulWidget {
  
  const MyTaskDetail({Key? key}) : super(key: key);
 
  @override
  State<MyTaskDetail> createState() => _MyTaskDetailState();
}

class _MyTaskDetailState extends State<MyTaskDetail> {
  
  final elevatedButtonStyle = ElevatedButton.styleFrom(
      shadowColor: Color.fromARGB(255, 54, 57, 244),
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
                height: 10,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: ElevatedButton(
                      style: elevatedButtonStyle,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'AceptTasks',
                        );
                      },
                      child: const Text("Aceptar"),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ElevatedButton(
                      style: elevatedButtonStyle,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '',
                        );
                      },
                      child: const Text("Rechazar"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
