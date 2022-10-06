import 'package:app_uteam/providers/wallet_form_provider.dart';
import 'package:app_uteam/screens/transaction_screen.dart';
import 'package:app_uteam/services/wallet_services.dart';

import 'package:app_uteam/widgets/wallet_home_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletHomeScreen extends StatefulWidget {
  WalletHomeScreen({Key? key}) : super(key: key);

  @override
  State<WalletHomeScreen> createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends State<WalletHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final WalletHomeService = Provider.of<WalletService>(context);

    return ChangeNotifierProvider(
      create: (_) => WalletFormProvider(WalletHomeService.selectedWallet),
      child: _WalletHomeScreenBody(walletHomeService: WalletHomeService),
    );
  }
}

class _WalletHomeScreenBody extends StatefulWidget {
  _WalletHomeScreenBody({
    Key? key,
    required this.walletHomeService,
  }) : super(key: key);

  WalletService walletHomeService;
  @override
  State<_WalletHomeScreenBody> createState() => _WalletHomeScreenBodyState();
}

class _WalletHomeScreenBodyState extends State<_WalletHomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      //itemCount: taskListProvider.tasks.length,
      itemCount: widget.walletHomeService.wallet.length,

      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          widget.walletHomeService.selectedWallet =
              widget.walletHomeService.wallet[index].copy();
          // Navigator.pushNamed(
          //   context,
          //   'AceptTasks',
          // );
        },
        child: WalletHomeCard(
          wallet: widget.walletHomeService.wallet[index],
        ),
      ),
    );
  }
}
