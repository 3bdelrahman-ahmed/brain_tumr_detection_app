part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

class OnboardingChangePage extends OnboardingState {
  final int pageIndex;
  OnboardingChangePage(this.pageIndex);
}
