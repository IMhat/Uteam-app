import 'package:app_uteam/models/user_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:app_uteam/providers/user_form_provider.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:app_uteam/services/user_services.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPostScreen extends StatefulWidget {
  const UserPostScreen({Key? key}) : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _pointsController = TextEditingController();
  late UserModel userModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userServiceProvider =
        Provider.of<UserService>(context, listen: false);
    final scanListProvider =
        Provider.of<UserListProvider>(context, listen: false);
    // final taskForm = Provider.of<TaskFormProvider>(context);
    //final task = taskForm.task;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nuevo Usuario'),
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
              height: 277,
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'Nombre de usuario',
                            labelText: 'username'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //   controller: _pointsController,
                      //   decoration: InputDecorations.authInputDecoration(
                      //       hintText: 'Puntos del usuario',
                      //       labelText: 'Puntos'),
                      // ),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _emailController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Email del usuario',
                              labelText: 'Email'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.save_outlined),
      //     onPressed: () async {
      //       if (_formKey.currentState!.validate()) {
      //         await UserService().saveUsers(_nameController.text,
      //             _emailController.text);
      //         final userListProvider =
      //             Provider.of<UserListProvider>(context, listen: false);
      //         userListProvider.nuevoUser(_nameController.text,
      //             _emailController.text);
      //       }
      //       userServiceProvider.users = [];
      //       userServiceProvider.loadUsers();
      //       Navigator.of(context).pop();
      //     }),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
