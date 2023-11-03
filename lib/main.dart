import 'dart:developer';

import 'package:bookly/core/configs/themes/dark_theme.dart';
import 'package:bookly/core/configs/themes/light_theme.dart';
import 'package:bookly/core/services/sl.dart';
import 'package:bookly/features/home/presentation/view_model/home_controller.dart';
import 'package:bookly/features/splash/presentation/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocator();
  log('initLocator');
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<HomeController>()..fetchNewestBooks(),
      child: MaterialApp(
        // routerConfig: BooklyRouter.router,
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: ThemeMode.dark,
        home: const SplashView(),
      ),
    );
  }
}
