import 'package:app_uteam/models/task_done.dart';

import 'package:flutter/material.dart';

class TaskDoneFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TaskDone taskDone;

  TaskDoneFormProvider(this.taskDone);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
