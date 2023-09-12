import 'package:bookly/features/home/presentation/view/components/app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Center(
        child: Text(
          "Home ...",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
