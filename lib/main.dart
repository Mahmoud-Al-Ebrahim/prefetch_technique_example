import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prefetch_technique_example/controller/prefetch_technique_bloc.dart';
import 'package:prefetch_technique_example/view/groups_page.dart';

void main() {

  // to solve this error "CERTIFICATE_VERIFY_FAILED: Hostname mismatch(handshake.cc:393)"
  HttpOverrides.global = MyHttpOverrides();

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

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
