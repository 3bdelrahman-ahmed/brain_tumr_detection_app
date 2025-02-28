import 'package:brain_tumr_detection_app/core/services/service_locator/service_locator.dart';
import 'package:brain_tumr_detection_app/features/onboarding/manager/onboarding_cubit.dart';
import 'package:brain_tumr_detection_app/features/onboarding/presentation/view/widgets/onboarding_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<OnboardingCubit>(),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return OnboardingScreenWidget();
          },
        ),
      ),
    );
  }
}
