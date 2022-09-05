import 'package:app_uteam/models/points_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:app_uteam/providers/point_form_provider.dart';
import 'package:app_uteam/providers/point_list_provider.dart';
import 'package:app_uteam/services/points_service.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PointPostScreen extends StatefulWidget {
  const PointPostScreen({Key? key}) : super(key: key);

  @override
  State<PointPostScreen> createState() => _PointPostScreenState();
}

class _PointPostScreenState extends State<PointPostScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pointController = TextEditingController();
  // final TextEditingController _dateController = TextEditingController();

  // final TextEditingController _doneController = TextEditingController();

  late PointModel pointModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pointServiceProvider =
        Provider.of<PointService>(context, listen: false);
    final scanListProvider =
        Provider.of<PointListProvider>(context, listen: false);
    // final taskForm = Provider.of<TaskFormProvider>(context);
    //final task = taskForm.task;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nuevo Puntaje'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 366,
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'Nombre de Usuario', labelText: 'Nombre'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Descripcion de la tarea',
                              labelText: 'Descripcion'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _pointController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Puntaje de la tarea',
                              labelText: 'Puntaje'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //     controller: _dateController,
                      //     decoration: InputDecorations.authInputDecoration(
                      //         hintText: 'Fecha de la tarea',
                      //         labelText: 'Fecha'),
                      //     validator: (dynamic dato) {
                      //       if (dato!.isEmpty) {
                      //         return 'Este campo es requerido';
                      //       }
                      //     }),
                      // const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await PointService().savePoints(
                _usernameController.text,
                _descriptionController.text,
                _pointController.text,
                // _dateController.text,
                // _doneController.text
              );
              final pointListProvider =
                  Provider.of<PointListProvider>(context, listen: false);
              pointListProvider.nuevaPoint(
                _usernameController.text,
                _descriptionController.text,
                _pointController.text,
                // _dateController.text

                // _doneController.text
              );
            }
            pointServiceProvider.points = [];
            pointServiceProvider.loadPoints();
            Navigator.of(context).pop();
          }),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
