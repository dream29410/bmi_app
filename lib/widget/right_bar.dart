
import 'package:flutter/material.dart';

class Rightbar extends StatelessWidget {
  final double barwidth;

  const Rightbar({Key? key, required this.barwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barwidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.purple),
        ),
      ],
    );
  }
}