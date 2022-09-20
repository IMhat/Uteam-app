
import 'package:app_uteam/widgets/task_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_form_provider.dart';
import '../services/task_services.dart';


class AceptTaskScreen extends StatefulWidget {
  AceptTaskScreen({Key? key}) : super(key: key);

  @override
  State<AceptTaskScreen> createState() => _AceptTaskScreenState();
}

class _AceptTaskScreenState extends State<AceptTaskScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final tasksService = Provider.of<TaskService>(context);
    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(tasksService.selectedTask),
      child: _ManageTaskScreenBody(tasksService: tasksService),
    );
  }
}

class _ManageTaskScreenBody extends StatefulWidget {
  _ManageTaskScreenBody({
    Key? key,
    required this.tasksService,
  }) : super(key: key);

  TaskService tasksService;
  @override
  State<_ManageTaskScreenBody> createState() => _ManageTaskScreenBodyState();
}

class _ManageTaskScreenBodyState extends State<_ManageTaskScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: MyTaskDetail(task: widget.tasksService.selectedTask),
      )
    );
  }
}