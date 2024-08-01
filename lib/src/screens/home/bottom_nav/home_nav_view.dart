import 'package:ecosense/src/screens/views/pie_chart_home_view.dart';
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
                              const Text(
                                "Welcome Back, Charles!",
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              Row(
                                children: [
                                  Text("Total Carbon Footprint"),
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
                              SizedBox(
                                height: 12,
                              ),
                              PieChartHomeView(),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: const Text(
                                    "Recommendations",
                                    style: TextStyle(fontSize: 14),
                                  )),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 18),
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
                                  ))
                            ]))));
          }
          if (state is HomeLoadingFailedState) Text(state.errorMessage);
          return const SizedBox();
        },
      ),
    );
  }
}
