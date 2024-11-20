import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prefetch_technique_example/controller/prefetch_technique_bloc.dart';
import 'package:prefetch_technique_example/view/groups_page.dart';

void main() {
  runApp(const PrefetchTechniqueExample());
}

class PrefetchTechniqueExample extends StatefulWidget {
  const PrefetchTechniqueExample({super.key});

  @override
  State<PrefetchTechniqueExample> createState() =>
      _PrefetchTechniqueExampleState();
}

class _PrefetchTechniqueExampleState extends State<PrefetchTechniqueExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PrefetchTechniqueBloc()..add(GetGroupsEvent()),
        child: const GroupsPage(),
      ),
    );
  }
}

