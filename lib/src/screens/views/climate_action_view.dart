import 'package:flutter/material.dart';

class ClimateActionView extends StatelessWidget {
  final String action;

  const ClimateActionView({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Color(0xff411900),
            blurRadius: 2,
            offset: Offset(4, 6), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            action,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
