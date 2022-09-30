import 'package:flutter/material.dart';

import 'BigText.dart';
import 'SmallText.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigText(
          text: text,
          size: 26,
        ),
        const SizedBox(
          height: 10,
        ),
        SmallText(
          text: "Recompensa",
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.blue),
            SizedBox(
              width: 55,
            ),
            IconAndTextWidget(
                icon: Icons.price_change_rounded,
                text: "1000",
                iconColor: Colors.blue),
          ],
        )
      ],
    );
  }
}
