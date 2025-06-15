import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_onboarding_background.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/onboarding_cubit.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context
        .watch<OnboardingCubit>(); // Use watch to rebuild on state change
    int currentIndex = cubit.currentIndex;
    var currentItem = cubit.images[currentIndex];
    final messages = [
      S.of(context).firstOnBoardingMessage,
      S.of(context).secondOnBoardingMessage,
      S.of(context).thirdOnBoardingMessage,
      S.of(context).fourthOnBoardingMessage,
      S.of(context).fifthOnBoardingMessage,
      S.of(context).sixthOnBoardingMessage,
    ];

    final sentences = [
      S.of(context).firstOnBoardingSentence,
      S.of(context).secondOnBoardingSentence,
      S.of(context).thirdOnBoardingSentence,
      S.of(context).fourthOnBoardingSentence,
      S.of(context).fifthOnBoardingSentence,
      S.of(context).sixthOnBoardingSentence,
    ];
    return CustomOnboardingBackground(
      widget: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 5,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: CustomImageView(
                  key: ValueKey<String>(currentItem),
                  imagePath: currentItem,
                  height: 275.h,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      child: Text(
                        messages[currentIndex],
                        key: ValueKey<String>(messages[currentIndex]),
                        style: AppTextStyles.font24GreenW500,
                      ),
                    ),
                    8.toHeight,
                    Expanded(
                      flex: 5,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                        child: Text(
                          sentences[currentIndex],
                          key: ValueKey<String>(sentences[currentIndex]),
                          style: AppTextStyles.font16GreenW400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    16.toHeight,
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                          text: currentIndex != 5
                              ? S.of(context).next
                              : S.of(context).letsStart,
                          onTap: currentIndex != 5
                              ? cubit.nextScreen
                              // () => Navigator.pushReplacementNamed(
                              //    context, AppRoutes.registerScreen))
                              : () {
                                  AppConstants.setOnBoardingBoolean(true);
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.loginScreen);
                                }),
                    ),
                  ],
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
