import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_form_provider.dart';
import '../services/user_services.dart';

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
                      begin: AlignmentDirectional.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.2,
                    0.4,
                    0.8
                  ],
                      colors: [
                    (Color(0xff7F00F0)),
                    Color.fromARGB(255, 165, 92, 179),
                    Color.fromARGB(255, 247, 90, 114)
                  ])),
              height: 220,
              margin: const EdgeInsets.only(top: 0, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Hello, Uteam",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Tenes 300 puntos",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(top: 0, right: 25),
                      //   width: 180,
                      //   height: 150,
                      //   child: ListView.builder(
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     //itemCount: taskListProvider.tasks.length,
                      //     itemCount: widget.userService.users.length,
                      //     itemBuilder: (BuildContext context, int index) =>
                      //         GestureDetector(
                      //       onTap: () {
                      //         widget.userService.selectedUser =
                      //             widget.userService.users[index].copy();
                      //         Navigator.pushNamed(
                      //           context,
                      //           'userPut',
                      //         );
                      //       },
                      //       child: MyUserCard(
                      //         user: widget.userService.users[index],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40, left: 220),
                child: const MyButtonNotification()),
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
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 250, 249, 249),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e88888888),
                          blurRadius: 10.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                        color: Color.fromARGB(255, 233, 232, 232),
                      ),
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hoy",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "2/10 Desafios",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40, bottom: 5),
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/home.jpeg"),
                      )
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
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        //child: const Text('My Button'),
      ),
    );
  }
}

class MyButtonTask extends StatelessWidget {
  const MyButtonTask({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          'ManageTasks',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),

        child: const Icon(
          Icons.arrow_forward,
          color: Colors.red,
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

// barra de progreso
//  Container(
//                             width: 250,
//                             height: 35,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black),
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: Stack(
//                               children: [
//                                 LayoutBuilder(
//                                     builder: (context, constraints) =>
//                                         Container(
//                                           width: constraints.maxWidth * 0.5,
//                                           decoration: BoxDecoration(
//                                               color: const Color.fromARGB(
//                                                   255, 222, 155, 195),
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                         )),
//                                 Positioned.fill(
//                                     child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("5 Días"),
//                                       Icon(Icons.calendar_today)
//                                     ],
//                                   ),
//                                 ))
//                               ],
//                             ),
//                           )