import 'package:app_uteam/screens/progres_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_form_provider.dart';
import '../services/task_services.dart';

class ProgresTaskView extends StatefulWidget {
  ProgresTaskView({Key? key}) : super(key: key);

  @override
  State<ProgresTaskView> createState() => _ProgresTaskViewState();
}

class _ProgresTaskViewState extends State<ProgresTaskView> {
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
      child: _ProgresTaskViewBody(tasksService: tasksService),
    );
  }
}

class _ProgresTaskViewBody extends StatefulWidget {
  _ProgresTaskViewBody({
    Key? key,
    required this.tasksService,
  }) : super(key: key);

  TaskService tasksService;
  @override
  State<_ProgresTaskViewBody> createState() => _ProgresTaskViewBodyState();
}

class _ProgresTaskViewBodyState extends State<_ProgresTaskViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 900,
        child: ProgresTask(task: widget.tasksService.selectedTask),
      ),
    );
  }
}
