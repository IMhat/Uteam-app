import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/task_inprogress.dart';
import 'package:flutter/material.dart';

class TaskInprogressCard extends StatefulWidget {
  final TaskInprogress taskInprogress;

  const TaskInprogressCard({Key? key, required this.taskInprogress})
      : super(key: key);

  @override
  State<TaskInprogressCard> createState() => _TaskInprogressCardState();
}

class _TaskInprogressCardState extends State<TaskInprogressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 0, bottom: 10),
      width: 200, height: 150,
      //decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _TaskDetails(
            //title: taskListProvider.tasks[i].title,
            // subTitle: taskListProvider.tasks[i].description,
            title: widget.taskInprogress.title,
            type: widget.taskInprogress.type,
            //subTitle: widget.task.description,
          ),
        ],
      ),
    );
  }
}

class _TaskDetails extends StatefulWidget {
  final String? title;
  final String? type;
  //final String? subTitle;

  const _TaskDetails({
    this.title,
    this.type,
  });

  @override
  State<_TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<_TaskDetails> {
  //Estilo de ElevatedButton
  // final elevatedButtonStyle = ElevatedButton.styleFrom(
  //     shadowColor: const Color.fromARGB(255, 54, 57, 244),
  //     elevation: 10,
  //     primary: Colors.deepPurple,
  //     onPrimary: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 320,
      height: 140,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 236, 237),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850]!.withOpacity(0.29),
              offset: const Offset(-10, 10),
              blurRadius: 10,
            )
          ]),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 251, 251)),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Text(
                    widget.title.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 7, 0, 0),
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.today_outlined),
                  const Text("2 hours ago"),
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    width: 150,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 251, 251)),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      widget.type.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
              // Text(
              //   widget.subTitle.toString(),
              //   style: const TextStyle(
              //       fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  //     color: Colors.indigo,
  //     borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class MyButtonBeginning extends StatelessWidget {
  const MyButtonBeginning({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'tasksPost',
        );
      },

      child: Container(
        width: 130,
        height: 30,
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
          'Empezar',
          style: TextStyle(color: Colors.white, fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ElevatedButton(
//   style: elevatedButtonStyle,
//   onPressed: () {
//     Navigator.pushNamed(
//       context,
//       'TaskDetail',
//     );
//   },
//   child: const Text("Ver"),
// ),
// ElevatedButton(
//   style: elevatedButtonStyle,
//   onPressed: () {
//     Navigator.pushNamed(
//       context,
//       'tasksPost',
//     );
//   },
//   child: const Text("Empezar"),
// ),
