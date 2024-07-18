import 'package:ecosense/src/repository/prompt_repository.dart';
import 'package:ecosense/src/screens/views/loading_view.dart';
import 'package:flutter/material.dart';

class LearnMoreScreen extends StatefulWidget {
  final String promptKeyWords;

  const LearnMoreScreen({super.key, required this.promptKeyWords});

  @override
  State<LearnMoreScreen> createState() => _LearnMoreScreenState();
}

class _LearnMoreScreenState extends State<LearnMoreScreen> {
  final _promptRepo = PromptRepository();
  String? geminiResponse;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getGeminiResponse();
  }

  getGeminiResponse() async {
    var response =
        await _promptRepo.learnMoreAboutClimateAction(widget.promptKeyWords);
    debugPrint("action points --->$response");
    setState(() {
      geminiResponse = response;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: loading
          ? const LoadingView()
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(geminiResponse ?? "")],
              ),
            ),
    ));
  }
}
