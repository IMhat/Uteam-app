import 'package:app_uteam/screens/home.dart';
import 'package:app_uteam/screens/home_page_body.dart';
import 'package:app_uteam/screens/product_details.dart';
import 'package:app_uteam/widgets/BigText.dart';
import 'package:app_uteam/widgets/SmallText.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  // @override
  // State<HomePage1> createState() => _HomePage1State();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: Expanded(child: HomePage()),
          ),
          Expanded(child: SingleChildScrollView(child: HomePageBody())),

          // Expanded(child: SingleChildScrollView(child: AcercaDe())),
        ],
      ),
    );
  }
}
