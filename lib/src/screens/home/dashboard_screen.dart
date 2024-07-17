import 'package:ecosense/src/repository/prompt_repository.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> destinations = [];
  final _promptRepo = PromptRepository();

  @override
  void initState() {
    super.initState();
    getActionPoints();
  }

  getActionPoints() async {
    var actionsPoints = await _promptRepo.generateClimateActionIdeas();
    debugPrint("action points --->$actionsPoints");
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Text(""),
    ));
  }
}
