import 'package:app_uteam/widgets/SmallText.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidet extends StatefulWidget {
  final String text;

  const ExpandableTextWidet({super.key, required this.text});

  @override
  State<ExpandableTextWidet> createState() => _ExpandableTextWidetState();
}

class _ExpandableTextWidetState extends State<ExpandableTextWidet> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 600 / 5.63;

  @override
  void iniState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                    text: hiddenText
                        ? (firstHalf + "...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {},
                  child: Row(children: [
                    SmallText(text: "Show more", color: Colors.black),
                    Icon(Icons.arrow_drop_down, color: Colors.black),
                  ]),
                )
              ],
            ),
    );
  }
}
