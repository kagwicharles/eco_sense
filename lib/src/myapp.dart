import 'package:ecosense/src/model_util.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  final modelUtil = ModelUtil();
  String? response;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: "Enter prompt"),
              ),
              response != null
                  ? Column(
                      children: [Text(response ?? "")],
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 44,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: submitPrompt, child: const Text("Submit"))
            ],
          ),
        ),
      ),
    ));
  }

  submitPrompt() async {
    if (controller.text != "") {
      setState(() {
        response = null;
        isLoading = true;
      });
      var res = await modelUtil.responseFromTextOnly(controller.text);
      if (res != null) {
        setState(() {
          response = res;
          isLoading = false;
        });
      }
    }
  }
}
