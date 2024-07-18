import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecosense/src/blocs/home/bloc.dart';
import 'package:ecosense/src/repository/prompt_repository.dart';
import 'package:ecosense/src/screens/views/climate_action_view.dart';
import 'package:ecosense/src/screens/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String>? actionPoints = [];
  final _promptRepo = PromptRepository();
  final HomeBloc homeBloc = HomeBloc();
  bool loading = true;
  int value = 1;

  List<Widget> navDestinations = [
    const Icon(
      Icons.book,
      color: Colors.white,
    ),
    const Icon(
      Icons.home,
      color: Colors.white,
    ),
    const Icon(
      Icons.person,
      color: Colors.white,
    )
  ];

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetActionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) LoadingView();
            if (state is HomeLoadingState) {
              return const LoadingView();
            }
            if (state is HomeLoadedState) {
              return Column(
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
                        horizontal: 14, vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.actions.length,
                          itemBuilder: (context, index) =>
                              ClimateActionView(action: state.actions[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 24,
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              );
            }
            if (state is HomeLoadingFailedState) Text(state.errorMessage);
            return const SizedBox();
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: value,
          color: const Color(0xff411900),
          backgroundColor: Colors.transparent,
          items: navDestinations,
          onTap: onDestinationSelected),
    ));
  }

  onDestinationSelected(int index) {
    setState(() {
      value = index;
    });
  }
}
