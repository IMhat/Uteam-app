import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MyRangoState extends StatelessWidget {
  const MyRangoState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const MyRango(),
    );
  }
}

class MyRango extends StatefulWidget {
  const MyRango({Key? key}) : super(key: key);

  @override
  State<MyRango> createState() => _MyRangoState();
}

class _MyRangoState extends State<MyRango> {
  SfRangeValues _values = const SfRangeValues(0.3, 0.7);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SfRangeSlider(
          values: _values,
          min: 0.0,
          max: 100.0,
          showLabels: true,
          interval: 20,
          showTicks: true,
          enableTooltip: true,
          onChanged: (dynamic newValues) {
            setState(() {
              _values = newValues;
            });
          }),
    ));
  }
}
