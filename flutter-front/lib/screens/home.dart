import 'package:app_uteam/screens/user_screens.dart';
import 'package:app_uteam/widgets/mi_user_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_form_provider.dart';
import '../services/user_services.dart';
import '../widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return ChangeNotifierProvider(
      create: (_) => UserFormProvider(userService.selectedUser),
      child: _UserHomeBody(userService: userService),
    );
  }
}

class _UserHomeBody extends StatefulWidget {
  _UserHomeBody({
    Key? key,
    required this.userService,
  }) : super(key: key);

  UserService userService;
  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<_UserHomeBody> {
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topEnd,
                      colors: [
                    Colors.deepPurple,
                    Color.fromARGB(255, 245, 98, 130)
                  ])),
              height: 220,
              margin: const EdgeInsets.only(top: 0, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Disponible",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 0, right: 25),
                        width: 180,
                        height: 150,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          //itemCount: taskListProvider.tasks.length,
                          itemCount: widget.userService.users.length,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                            onTap: () {
                              widget.userService.selectedUser =
                                  widget.userService.users[index].copy();
                              Navigator.pushNamed(
                                context,
                                'userPut',
                              );
                            },
                            child: MyUserCard(
                              user: widget.userService.users[index],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 30, right: 10),
                          child: const MyButtonNotification()),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, left: 300),
              child: Row(
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Color.fromARGB(255, 211, 211, 211),
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 110,
                margin: const EdgeInsets.only(
                    top: 150, left: 30, right: 30, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e88888888),
                          blurRadius: 10.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Mis objetivos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            "Mis objetivos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 250,
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(50)),
                            child: Stack(
                              children: [
                                LayoutBuilder(
                                    builder: (context, constraints) =>
                                        Container(
                                          width: constraints.maxWidth * 0.5,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 222, 155, 195),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        )),
                                Positioned.fill(
                                    child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("5 Días"),
                                      Icon(Icons.calendar_today)
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Expanded(child: SingleChildScrollView(child: AcercaDe())),
          ],
        ),
      ),
    );
  }
}

class MyButtonNotification extends StatelessWidget {
  const MyButtonNotification({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'Notification',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(
          Icons.notifications_active_rounded,
          size: 40,
          color: Colors.orange,
        ),
        //child: const Text('My Button'),
      ),
    );
  }
}



// const Text("60/100"),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Center(
//                             child: SizedBox(
//                               width: 150,
//                               height: 20,
//                               child: Container(
//                                 color: const Color.fromARGB(255, 243, 166, 230),
//                                 child: const LinearProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation(
//                                       Color.fromARGB(255, 209, 174, 243)),
//                                   backgroundColor:
//                                       Color.fromARGB(255, 242, 176, 218),
//                                 ),
//                               ),
//                             ),
//                           )