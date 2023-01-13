import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  const ReusableWidget({required this.colour, required this.cardchild});

  final Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardchild,
    );
  }
}
