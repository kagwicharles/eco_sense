import 'package:ecosense/src/screens/views/bar_chart_view.dart';
import 'package:ecosense/src/screens/views/more_action_view.dart';
import 'package:ecosense/src/screens/views/stat_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/home/home_bloc.dart';
import '../../../repository/prompt_repository.dart';
import '../../views/climate_action_view.dart';
import '../../views/loading_view.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  final _promptRepo = PromptRepository();
  List<String>? actionPoints = [];
  final HomeBloc homeBloc = HomeBloc();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetActionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) const LoadingView();
          if (state is HomeLoadingState) {
            return const LoadingView();
          }
          if (state is HomeLoadedState) {
            return Expanded(
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 28,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Welcome back,",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Charles!",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              const Row(
                                children: [
                                  Text("Your Carbon Footprint"),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "40kgCO2",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey[400]!),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    StatItemView(
                                        title: "Food", icon: Icons.food_bank),
                                    StatItemView(
                                        title: "Transport",
                                        icon: Icons.bus_alert),
                                    StatItemView(
                                        title: "Power", icon: Icons.power)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const BarChartHomeView(),
                              const SizedBox(
                                height: 18,
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: const Text(
                                    "Suggestions",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                height: 18,
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.actions.length,
                                    itemBuilder: (context, index) =>
                                        ClimateActionView(
                                            action: state.actions[index]),
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const SizedBox(
                                      height: 12,
                                    ),
                                  )),
                              const SizedBox(
                                height: 28,
                              ),
                              GridView(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 14),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.5),
                                children: const [
                                  MoreActionView(
                                      color: Colors.green,
                                      icon: Icons.map,
                                      title: "Heat Maps")
                                ],
                              )
                            ]))));
          }
          if (state is HomeLoadingFailedState) Text(state.errorMessage);
          return const SizedBox();
        },
      ),
    );
  }
}
