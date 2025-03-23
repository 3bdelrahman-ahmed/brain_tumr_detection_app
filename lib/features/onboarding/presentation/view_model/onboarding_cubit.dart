import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/assets/assets_png.dart';
import '../../../../core/utils/string/app_string.dart';

part 'onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int currentIndex = 0;
  final List<Map<String, dynamic>> items = [
    {
      "image": AssetsPng.welcomeOnBoarding.toPng(),
      "message": AppStrings.firstOnBoardingMessage,
      "sentence": AppStrings.firstOnBoardingSentence
    },
    {
      "image": AssetsPng.secondOnBoarding.toPng(),
      "message": AppStrings.secondOnBoardingMessage,
      "sentence": AppStrings.secondOnBoardingSentence
    },
    {
      "image": AssetsPng.thirdOnBoarding.toPng(),
      "message": AppStrings.thirdOnBoardingMessage,
      "sentence": AppStrings.thirdOnBoardingSentence
    },
    {
      "image": AssetsPng.fourthOnBoarding.toPng(),
      "message": AppStrings.fourthOnBoardingMessage,
      "sentence": AppStrings.fourthOnBoardingSentence
    },
    {
      "image": AssetsPng.fifthOnBoarding.toPng(),
      "message": AppStrings.fifthOnBoardingMessage,
      "sentence": AppStrings.fifthOnBoardingSentence
    },
    {
      "image": AssetsPng.sixthOnBoarding.toPng(),
      "message": AppStrings.sixthOnBoardingMessage,
      "sentence": AppStrings.sixthOnBoardingSentence
    }
  ];
  void nextScreen() {
    if (currentIndex < 5) {
      currentIndex++;
      emit(OnboardingChangePage(currentIndex));
    }
  }
}
