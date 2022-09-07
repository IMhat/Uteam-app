import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/providers/task_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskListProvider =
        Provider.of<TaskListProvider>(context, listen: false);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, bottom: 50),
          width: 250,
          height: 150,
          //decoration: _cardBorders(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _TaskDetails(
                //title: taskListProvider.tasks[i].title,
                // subTitle: taskListProvider.tasks[i].description,
                title: task.title,
                subTitle: task.description,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // BoxDecoration _cardBorders() => BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(25),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
  //         ]);
}

class _TaskDetails extends StatefulWidget {
  final String? title;
  final String? subTitle;

  const _TaskDetails({this.title, this.subTitle});

  @override
  State<_TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<_TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 170, 209),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850]!.withOpacity(0.29),
              offset: const Offset(-10, 10),
              blurRadius: 10,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title.toString(),
            style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 7, 0, 0),
                fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.subTitle.toString(),
            style: const TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 65),
            child: MyButtonBeginning(),
          )
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
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
          '',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: AlignmentDirectional.topEnd, colors: [
            Color.fromARGB(255, 242, 133, 157),
            Color.fromARGB(255, 167, 79, 211)
          ]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Empezar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
