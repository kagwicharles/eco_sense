import 'package:ecosense/src/screens/home/learnmore_screen.dart';
import 'package:ecosense/src/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class ClimateActionView extends StatelessWidget {
  final String action;

  const ClimateActionView({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
          onTap: () {
            context.navigate(LearnMoreScreen(promptKeyWords: action));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                action,
              ),
            ],
          )),
    );
  }
}
