import 'package:flutter/material.dart';

class MoreActionView extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  const MoreActionView(
      {super.key,
      required this.icon,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 34,
            color: color,
          ),
          SizedBox(
            height: 8,
          ),
          Text(title)
        ],
      ),
    );
  }
}
