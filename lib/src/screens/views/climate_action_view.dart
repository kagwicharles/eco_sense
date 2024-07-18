import 'package:ecosense/src/screens/home/learnmore_screen.dart';
import 'package:ecosense/src/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class ClimateActionView extends StatelessWidget {
  final String action;

  const ClimateActionView({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
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
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 14,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.navigate(LearnMoreScreen(promptKeyWords: action));
              },
              child: const Text("Learn More"),
            ),
          )
        ],
      ),
    );
  }
}
