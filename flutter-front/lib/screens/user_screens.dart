import 'package:flutter/material.dart';
import 'package:app_uteam/providers/user_form_provider.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:app_uteam/services/user_services.dart';
import 'package:app_uteam/widgets/user_card.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return ChangeNotifierProvider(
      create: (_) => UserFormProvider(userService.selectedUser),
      child: _UserScreenBody(userService: userService),
    );
  }
}

class _UserScreenBody extends StatefulWidget {
  _UserScreenBody({
    Key? key,
    required this.userService,
  }) : super(key: key);

  UserService userService;
  @override
  State<_UserScreenBody> createState() => _UserScreenBodyState();
}

class _UserScreenBodyState extends State<_UserScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Cuenta',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0, left: 25),
                  width: 200,
                  height: 150,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
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
                      child: UserCard(
                        user: widget.userService.users[index],
                      ),
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Color.fromARGB(255, 225, 223, 223),
                  backgroundImage: AssetImage('assets/user.png'),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.only(top: 0, left: 20, bottom: 20),
                width: 320,
                height: 500,
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "Favourite",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.no_encryption_gmailerrorred)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "Edit Account",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "Settings and Privacy",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.settings)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0, bottom: 20),
                      width: 100,
                      height: 80,
                      decoration: _cardBorders(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "Help",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.help_outlined)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () => Navigator.pushNamed(context, 'usersPost'),
      // )
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[850]!.withOpacity(0.29),
            offset: const Offset(-10, 15),
            blurRadius: 10,
          )
        ]);
