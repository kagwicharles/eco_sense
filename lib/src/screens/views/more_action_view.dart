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
          color: Colors.green, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 34,
            color: Colors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
