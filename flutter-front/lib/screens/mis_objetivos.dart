import 'package:flutter/material.dart';

class MyObjetives extends StatefulWidget {
  const MyObjetives({super.key});

  @override
  State<MyObjetives> createState() => _MyObjetivesState();
}

class _MyObjetivesState extends State<MyObjetives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [Positioned(child: Container())],
    ));
  }
}
