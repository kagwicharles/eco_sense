import 'package:flutter/material.dart';

class StatItemView extends StatelessWidget {
  final String title;
  final IconData icon;

  const StatItemView({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 34,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(title)
      ],
    );
  }
}
