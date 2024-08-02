import 'package:flutter/material.dart';

class MoreActionView extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final Function() function;
  const MoreActionView(
      {super.key,
      required this.icon,
      required this.title,
      required this.color,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
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
        ));
  }
}
