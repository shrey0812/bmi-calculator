import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: 25,
            width: barWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Color.fromARGB(255, 193, 191, 39),
            ))
      ],
    );
  }
}
