import 'package:flutter/material.dart';
import '../widgets/onboarding_screen_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingScreenWidget(),
    );
  }
}
