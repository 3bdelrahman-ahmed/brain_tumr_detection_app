import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_onboarding_background.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/onboarding/manager/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/custom_image_view.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context
        .watch<OnboardingCubit>(); // Use watch to rebuild on state change
    int currentIndex = cubit.currentIndex;
    var currentItem = cubit.items[currentIndex];

    return CustomOnboardingBackground(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                key: ValueKey<String>(currentItem["image"]),
                imagePath: currentItem["image"],
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
                      currentItem["message"],
                      key: ValueKey<String>(currentItem["message"]),
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
                        currentItem["sentence"],
                        key: ValueKey<String>(currentItem["sentence"]),
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
                            ? AppStrings.next
                            : AppStrings.letsStart,
                        onTap: currentIndex != 5
                            ? cubit.nextScreen
                            : () => Navigator.pushReplacementNamed(
                                context, AppRoutes.loginScreen)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
