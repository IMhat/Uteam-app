import 'package:app_uteam/providers/product_form_provider.dart';
import 'package:app_uteam/providers/wallet_form_provider.dart';
import 'package:app_uteam/services/wallet_services.dart';
import 'package:app_uteam/widgets/wallet_card.dart';
import 'package:flutter/material.dart';

import 'package:app_uteam/services/product_services.dart';

import 'package:app_uteam/widgets/product_card.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    final walletService = Provider.of<WalletService>(context);
    final productsService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      // create: (_) => WalletFormProvider(walletService.selectedWallet),
      create: (_) => ProductFormProvider(productsService.selectedProduct,walletService.selectedWallet),

      child: _TabScreenBody(
          walletService: walletService, productsService: productsService),
    );
  }
}

// class _Tab2ScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final productsService = Provider.of<ProductService>(context);
//     return ChangeNotifierProvider(
//       create: (_) => ProductFormProvider(productsService.selectedProduct),
//       child: _TabScreenBody(productsService: productsService),
//     );
//   }
// }

class _TabScreenBody extends StatefulWidget {
  _TabScreenBody({
    Key? key,
    required this.walletService,
    required this.productsService,
  }) : super(key: key);

  WalletService walletService;
  ProductService productsService;
  @override
  State<_TabScreenBody> createState() => _TabScreenBodyState();
}

// class _Tab2ScreenBody extends StatefulWidget {

//   _Tab2ScreenBody({
//     Key? key,
//     required this.productsService,
//   }) : super(key: key);

//   ProductService productService;
//   @override
//   State<_TabScreenBody> createState() => _TabScreenBodyState();
// }

class _TabScreenBodyState extends State<_TabScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Uteam points'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(indent: 2),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Catalogo de canje",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                        height: 150,
                        width: 250,
                        child: Center(
                          child: ListView.builder(
                            itemCount: widget.walletService.wallet.length,
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                              onTap: () {
                                widget.walletService.selectedWallet =
                                    widget.walletService.wallet[index].copy();
                              },
                              child: WalletCard(
                                wallet: widget.walletService.wallet[index],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0, right: 10),
                  width: 70,
                  height: 60,
                  child: Container(
                    margin: const EdgeInsets.only(top: 0, right: 5),
                    child: Row(
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 30.0,
                              backgroundColor:
                                  Color.fromARGB(255, 225, 223, 223),
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
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 236, 222, 240),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const TextField(
                      controller: null,
                      decoration: InputDecoration(
                        hintText: "Productos",
                        icon: Icon(Icons.search,
                            color: Color.fromARGB(
                              255,
                              175,
                              171,
                              171,
                            )),
                        suffixIcon: Icon(
                          Icons.tune,
                          size: 30.00,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 231, 170, 209),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/painting1.png"),
                  ),
                  const Divider(
                    indent: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 231, 170, 209),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/painting2.png"),
                  )
                ],
              ),
            ),
            const Divider(
              indent: 4,
            ),
            DefaultTabController(
              length: 3,
              child: Column(
                children: const [
                  Text(
                    "Elige tu producto",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.start,
                  ),
                  TabBar(
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color(0xff5D4FB1)),
                      labelColor: Color.fromARGB(255, 255, 255, 255),
                      unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                      tabs: [
                        Tab(text: "All"),
                        Tab(text: "A tu alcance"),
                        Tab(text: "Nuevos"),
                      ]),
                ],
              ),
            ),
            const Divider(endIndent: 2),
            SizedBox(
              width: 350,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: widget.productsService.products.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    widget.productsService.selectedProduct =
                        widget.productsService.products[index].copy();
                    Navigator.pushNamed(
                      context,
                      'AcercaDe',
                    );
                  },
                  child: ProductCard(
                    product: widget.productsService.products[index],
                  ),
                ),
              ),
              // child: Container(
              //     decoration: const BoxDecoration(
              //         color: Color.fromARGB(255, 150, 190, 209),
              //         borderRadius: BorderRadius.all(Radius.circular(30)))),
            ),
          ],
        ),
      ),
    );
  }
}
