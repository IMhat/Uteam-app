import 'package:app_uteam/providers/task_form_provider.dart';
import 'package:app_uteam/services/task_services.dart';
import 'package:app_uteam/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../services/task_services.dart';

class MyTaskScreen extends StatefulWidget {
  MyTaskScreen({Key? key}) : super(key: key);

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> {
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
      child: _MyTaskScreenBody(tasksService: tasksService),
    );
  }
}

class _MyTaskScreenBody extends StatefulWidget {
  _MyTaskScreenBody({
    Key? key,
    required this.tasksService,
  }) : super(key: key);

  TaskService tasksService;
  @override
  State<_MyTaskScreenBody> createState() => _MyTaskScreenBodyState();
}

class _MyTaskScreenBodyState extends State<_MyTaskScreenBody> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafios'),
      ),
      body: Material(
        child: Center(
          child: ListView.builder(
            //itemCount: taskListProvider.tasks.length,
            itemCount: widget.tasksService.tasks.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                widget.tasksService.selectedTask =
                    widget.tasksService.tasks[index].copy();
                Navigator.pushNamed(
                  context,
                  'taskPut',
                );
              },
              child: TaskCard(
                task: widget.tasksService.tasks[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
