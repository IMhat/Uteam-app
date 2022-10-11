import 'package:app_uteam/providers/wallet_form_provider.dart';
import 'package:app_uteam/screens/transaction_exchange_screen.dart';
import 'package:app_uteam/screens/transaction_screen.dart';
import 'package:app_uteam/services/wallet_services.dart';

import 'package:app_uteam/widgets/wallet_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();

    final walletService = Provider.of<WalletService>(context);

    return ChangeNotifierProvider(
      create: (_) => WalletFormProvider(walletService.selectedWallet),
      child: _WalletScreenBody(walletService: walletService),
    );
  }
}

class _WalletScreenBody extends StatefulWidget {
  _WalletScreenBody({
    Key? key,
    required this.walletService,
  }) : super(key: key);

  WalletService walletService;
  @override
  State<_WalletScreenBody> createState() => _WalletScreenBodyState();
}

class _WalletScreenBodyState extends State<_WalletScreenBody>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        TabController(length: 2, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //PointService pointService;

    //final pointListProvider = Provider.of<PointListProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Mi Billetera",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 0, left: 50),
            width: 500,
            color: Colors.white,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                //itemCount: taskListProvider.tasks.length,
                itemCount: widget.walletService.wallet.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    widget.walletService.selectedWallet =
                        widget.walletService.wallet[index].copy();
                    // Navigator.pushNamed(
                    //   context,
                    //   'pointPut',
                    // );
                  },
                  child: WalletCard(
                    wallet: widget.walletService.wallet[index],
                  ),
                ),
              ),
            ),
          ),
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
                      child: Text("Mis ingresos"),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text("Mis Gastos"),
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
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                  child: TransactionScreen()),
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                  child: ExchangeTransactionScreen()),
            ],
          ))
        ],
      ),
    );
  }
}



//     Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               width: 250,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Mi Billetera",
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 40, bottom: 20, left: 50),
//               width: 500,
//               color: Colors.white,
//               child: Center(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   //itemCount: taskListProvider.tasks.length,
//                   itemCount: widget.walletService.wallet.length,
//                   itemBuilder: (BuildContext context, int index) =>
//                       GestureDetector(
//                     onTap: () {
//                       widget.walletService.selectedWallet =
//                           widget.walletService.wallet[index].copy();
//                       // Navigator.pushNamed(
//                       //   context,
//                       //   'pointPut',
//                       // );
//                     },
//                     child: WalletCard(
//                       wallet: widget.walletService.wallet[index],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(width: 1, color: Colors.deepPurple))),
//               child: Material(
//                 color: Colors.white,
//                 child: TabBar(
//                   controller: controller,
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.grey,
//                   tabs: [
//                     Tab(
//                       child: Container(
//                         child: Text("Backlog"),
//                       ),
//                     ),
//                     Tab(
//                       child: Container(
//                         child: Text("In Progress"),
//                       ),
//                     ),
//                     Tab(
//                       child: Container(
//                         child: Text("Done"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Expanded(
//             //     child: TabBarView(
//             //   controller: controller,
//             //   children: [
//             //     Container(
//             //         margin:
//             //             const EdgeInsets.only(top: 30, left: 20, bottom: 20),
//             //         child: TransactionScreen()),
//             //     Container(
//             //         margin:
//             //             const EdgeInsets.only(top: 30, left: 20, bottom: 20),
//             //         child: ExchangeTransactionScreen()),
//             //   ],
//             // ))
//           ],
//         ),
//       ),
//     );
//   }
// }



