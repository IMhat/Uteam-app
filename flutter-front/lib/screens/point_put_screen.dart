import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/providers/point_form_provider.dart';
import 'package:app_uteam/services/points_service.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:app_uteam/providers/task_list_provider.dart';

class PointPutScreen extends StatefulWidget {
  const PointPutScreen({Key? key}) : super(key: key);

  @override
  State<PointPutScreen> createState() => _PointPutScreenState();
}

class _PointPutScreenState extends State<PointPutScreen> {
  @override
  Widget build(BuildContext context) {
    final pointService = Provider.of<PointService>(context);

    return ChangeNotifierProvider(
      create: (_) => PointFormProvider(pointService.selectedPoint),
      child: _PointPutScreenBody(pointService: pointService),
    );
  }
}

class _PointPutScreenBody extends StatefulWidget {
  _PointPutScreenBody({Key? key, required this.pointService}) : super(key: key);

  PointService pointService;

  @override
  State<_PointPutScreenBody> createState() => _PointPutScreenBodyState();
}

class _PointPutScreenBodyState extends State<_PointPutScreenBody> {
  @override
  Widget build(BuildContext context) {
    final pointServiceProvider = Provider.of<PointService>(context);

    final pointForm = Provider.of<PointFormProvider>(context);
    final point = pointForm.point;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Editar Puntaje'),
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
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: pointForm.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: point.username,
                        onChanged: (value) => point.username = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Username'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El titulo es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: point.description,
                        onChanged: (value) => point.description = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Descripcion'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La descripcion es obligatoria';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: point.point,
                        onChanged: (value) => point.point = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Puntos'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El puntaje es obligatorio';
                          }
                        },
                      ),
                      // const SizedBox(height: 10),
                      // TextFormField(
                      //   initialValue: point.date,
                      //   onChanged: (value) => point.date = value,
                      //   decoration: InputDecorations.authInputDecoration(
                      //       hintText: "", labelText: 'Fecha'),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'La fecha es obligatoria';
                      //     }
                      //   },
                      // ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    child: const Icon(Icons.save_outlined),
                    onPressed: () async {
                      if (!pointForm.isValidForm()) return;
                      await widget.pointService.updatePoint(pointForm.point);
                      pointServiceProvider.points = [];
                      pointServiceProvider.loadPoints();
                      Navigator.pushReplacementNamed(context, 'ManagePoints');
                    }),
                FloatingActionButton(
                    backgroundColor: Colors.white,
                    heroTag: null,
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                    onPressed: () async {
                      if (!pointForm.isValidForm()) return;
                      await widget.pointService.deletePoint(pointForm.point);
                      // taskServiceProvider.loadTasks();
                      pointServiceProvider.points = [];
                      pointServiceProvider.loadPoints();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
