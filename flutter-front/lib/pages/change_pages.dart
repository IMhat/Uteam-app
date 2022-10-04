import 'package:app_uteam/screens/home1.dart';
import 'package:app_uteam/screens/screens.dart';
import 'package:app_uteam/screens/search_screen.dart';
import 'package:app_uteam/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/wallet_screens.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16.00,
        unselectedFontSize: 11.0,
        selectedItemColor: Colors.purple,
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.store_mall_directory), label: 'Catalogo'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busqueda'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Billetera'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Cuenta'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.account_box), label: 'admin'),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),

      children: [
        const HomePage1(),
        TabScreen(),
        //MyTaskScreen(),
        const SearchScreen(),
        WalletScreen(),
        UserScreen(),
        // AdminScreen()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
