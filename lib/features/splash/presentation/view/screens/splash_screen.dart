import 'package:flutter/material.dart';

import '../widgets/splash_screen_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenWidget(),
    );
  }
}
