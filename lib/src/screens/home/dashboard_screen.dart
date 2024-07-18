import 'package:ecosense/src/repository/prompt_repository.dart';
import 'package:ecosense/src/screens/views/climate_action_view.dart';
import 'package:ecosense/src/screens/views/loading_view.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String>? actionPoints = [];
  final _promptRepo = PromptRepository();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getActionPoints();
  }

  getActionPoints() async {
    var actions = await _promptRepo.generateClimateActionIdeas();
    debugPrint("action points --->$actionPoints");
    setState(() {
      actionPoints = actions;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: loading
          ? const LoadingView()
          : actionPoints != null
              ? Column(
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: const Text(
                          "Easy actions you can take to reduce your carbon footprint and make Earth a better place",
                          style: TextStyle(
                              fontSize: 28, fontStyle: FontStyle.italic),
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: actionPoints?.length ?? 0,
                            itemBuilder: (context, index) =>
                                ClimateActionView(action: actionPoints![index]),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 24,
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                )
              : const Text("Empty!"),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        height: 58,
        color: const Color(0xff411900),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    ));
  }
}
