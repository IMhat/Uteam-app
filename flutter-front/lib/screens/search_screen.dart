import 'package:app_uteam/widgets/Rango_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
        shadowColor: Color.fromARGB(255, 54, 57, 244),
        elevation: 10,
        primary: Colors.deepPurple,
        onPrimary: Colors.white);

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 75, 61, 76)),
      backgroundColor: const Color.fromARGB(255, 75, 61, 76),
      body: SingleChildScrollView(
        child: Container(
          decoration: _cardBorders(),
          margin: const EdgeInsetsDirectional.only(top: 150),
          width: 500,
          height: 600,
          child: Container(
            margin: const EdgeInsets.only(top: 30, bottom: 20),
            width: 100,
            height: 80,
            decoration: _cardBorders(),
            child: Column(
              children: [
                const Text(
                  "Busqueda",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 150),
                  child: const Text(
                    "Categorias",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                        child: const Text("Gaming"),
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
                        child: const Text("Cursos"),
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
                        child: const Text("Indumentaria"),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, right: 100),
                  width: 150,
                  height: 50,
                  child: const Text(
                    "Puntos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
                  child: const MyRangoState(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.white,
                      child: ElevatedButton(
                        style: elevatedButtonStyle,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            'ManageTasks',
                          );
                        },
                        child: const Text("Limpiar"),
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
                        child: const Text("Aplicar filtros"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(30),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[850]!.withOpacity(0.29),
            offset: const Offset(-10, 15),
            blurRadius: 10,
          )
        ]);

class MyButtonGaming extends StatelessWidget {
  const MyButtonGaming({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          '',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
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
          'Gaming',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
