import 'package:app_uteam/providers/task_form_provider.dart';
import 'package:app_uteam/screens/backlog_screen.dart';

import 'package:app_uteam/services/task_services.dart';
import 'package:app_uteam/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/task_services.dart';

class ManageTaskScreen extends StatefulWidget {
  const ManageTaskScreen({Key? key}) : super(key: key);

  @override
  State<ManageTaskScreen> createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageTaskScreen> {
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

class _ManageTaskScreenBodyState extends State<_ManageTaskScreenBody>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        TabController(length: 3, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.deepPurple))),
            child: Material(
              color: Colors.white,
              child: TabBar(
                controller: controller,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text("Backlog"),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text("In Progress"),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text("Done"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller,
            children: [
              Text("data"),
              Text("data2"),
              Text("data3"),
            ],
          ))
        ],
      ),
      // Container(
      //   margin: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
      //   width: 350,
      //   color: Colors.white,
      //   child: Center(
      //     child: ListView.builder(
      //       shrinkWrap: true,
      //       physics: const NeverScrollableScrollPhysics(),
      //       scrollDirection: Axis.vertical,
      //       //itemCount: taskListProvider.tasks.length,
      //       itemCount: widget.tasksService.tasks.length,

      //       itemBuilder: (BuildContext context, int index) =>
      //           GestureDetector(
      //         onTap: () {
      //           widget.tasksService.selectedTask =
      //               widget.tasksService.tasks[index].copy();
      //           Navigator.pushNamed(
      //             context,
      //             'AceptTasks',
      //           );
      //         },
      //         child: TaskCard(
      //           task: widget.tasksService.tasks[index],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

// Container(
//   padding: const EdgeInsets.only(
//     top: 10,
//   ),
//   width: 100,
//   height: 45,
//   decoration: BoxDecoration(
//       color: Colors.green,
//       border: Border.all(
//           color:
//               const Color.fromARGB(255, 255, 251, 251)),
//       borderRadius: BorderRadius.circular(50)),
//   child: const Text(
//     "All",
//     style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 0, 0, 0)),
//     textAlign: TextAlign.center,
//   ),
// ),
// Container(
//   padding: const EdgeInsets.only(
//     top: 10,
//   ),
//   width: 120,
//   height: 45,
//   decoration: BoxDecoration(
//       color: const Color.fromARGB(255, 255, 98, 0),
//       border: Border.all(
//           color:
//               const Color.fromARGB(255, 255, 251, 251)),
//       borderRadius: BorderRadius.circular(50)),
//   child: const Text(
//     "En progreso",
//     style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 0, 0, 0)),
//     textAlign: TextAlign.center,
//   ),
// ),
// Container(
//   padding: const EdgeInsets.only(
//     top: 10,
//   ),
//   width: 120,
//   height: 45,
//   decoration: BoxDecoration(
//       color: Colors.green,
//       border: Border.all(
//           color:
//               const Color.fromARGB(255, 255, 251, 251)),
//       borderRadius: BorderRadius.circular(50)),
//   child: const Text(
//     "Finalizado",
//     style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 0, 0, 0)),
//     textAlign: TextAlign.center,
//   ),
// ),
