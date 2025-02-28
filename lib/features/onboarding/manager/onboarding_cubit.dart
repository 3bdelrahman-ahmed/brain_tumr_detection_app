import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/assets/assets_png.dart';
import '../../../core/utils/string/app_string.dart';

part 'onboarding_state.dart';
@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int currentIndex = 0;
  final List<Map<String, dynamic>> items = [
    {
      "image":AssetsPng.welcomeOnBoarding.toPng(),
      "message":AppString.firstOnBoardingMessage,
      "sentence":AppString.firstOnBoardingSentence
    },
    {
      "image":AssetsPng.secondOnBoarding.toPng(),
      "message":AppString.secondOnBoardingMessage,
      "sentence":AppString.secondOnBoardingSentence
    },
    {
      "image":AssetsPng.thirdOnBoarding.toPng(),
      "message":AppString.thirdOnBoardingMessage,
      "sentence":AppString.thirdOnBoardingSentence
    },
    {
      "image":AssetsPng.fourthOnBoarding.toPng(),
      "message":AppString.fourthOnBoardingMessage,
      "sentence":AppString.fourthOnBoardingSentence
    },
    {
      "image":AssetsPng.fifthOnBoarding.toPng(),
      "message":AppString.fifthOnBoardingMessage,
      "sentence":AppString.fifthOnBoardingSentence
    },
    {
      "image":AssetsPng.sixthOnBoarding.toPng(),
      "message":AppString.sixthOnBoardingMessage,
      "sentence":AppString.sixthOnBoardingSentence
    }
  ];
  void nextScreen() {
    if (currentIndex < 5) {
      currentIndex++;
      emit(OnboardingChangePage(currentIndex));
    }
  }
}
