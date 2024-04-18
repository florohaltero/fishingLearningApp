import 'package:angelschein_lernen/common/custom_themes.dart';
import 'package:angelschein_lernen/feature/counter/counter_controller.dart';
import 'package:angelschein_lernen/feature/counter/counter_view.dart';
import 'package:angelschein_lernen/feature/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../feature/main/main_controller.dart';

part 'router.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: _appRouter,
      title: 'Angelschein Lernen App',
      theme: CustomTheme().light,
      darkTheme: CustomTheme().dark,
    );
  }
}
