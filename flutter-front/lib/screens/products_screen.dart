import 'package:flutter/material.dart';
import 'package:app_uteam/providers/user_form_provider.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:app_uteam/services/user_services.dart';
import 'package:app_uteam/widgets/mi_user_card.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return ChangeNotifierProvider(
      create: (_) => UserFormProvider(userService.selectedUser),
      child: _TabScreenBody(userService: userService),
    );
  }
}

class _TabScreenBody extends StatefulWidget {
  _TabScreenBody({
    Key? key,
    required this.userService,
  }) : super(key: key);

  UserService userService;
  @override
  State<_TabScreenBody> createState() => _TabScreenBodyState();
}

class _TabScreenBodyState extends State<_TabScreenBody> {
  @override
  Widget build(BuildContext context) {
    UserService userService;
    final userListProvider = Provider.of<UserListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Uteam points'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(indent: 2),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 110,
                  width: 250,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Catalogo de canje",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(indent: 2),
                SizedBox(
                  height: 100,
                  width: 80,
                  child: Container(
                    child: Row(
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 40.0,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage('assets/user.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                const Divider(endIndent: 2),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: Container(
                    color: const Color.fromARGB(255, 189, 211, 233),
                    child: const TextField(
                      controller: null,
                      decoration: InputDecoration(
                          icon: Icon(Icons.search,
                              color: Color.fromARGB(255, 175, 171, 171))),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: <Widget>[
                    const Divider(endIndent: 2),
                    SizedBox(
                        height: 200,
                        width: 300,
                        child: Center(
                          child: ListView.builder(
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
                        ))
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Divider(endIndent: 2),
                SizedBox(
                  height: 100,
                  width: 300,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 195, 204, 207),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                )
              ],
            ),
            Column(
              children: <Widget>[
                const Divider(endIndent: 2),
                SizedBox(
                  height: 150,
                  width: 300,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 150, 190, 209),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                )
              ],
            ),
            Column(
              children: <Widget>[
                const Divider(endIndent: 2),
                SizedBox(
                  height: 150,
                  width: 300,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 150, 190, 209),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
