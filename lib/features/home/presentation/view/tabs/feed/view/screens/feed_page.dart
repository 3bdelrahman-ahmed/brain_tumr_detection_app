import 'package:brain_tumr_detection_app/core/utils/string/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/feed/view/widgets/post_card.dart';
import 'package:brain_tumr_detection_app/foundations/validations.dart';
import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_png.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/tabs/feed/view/widgets/welcome_row.dart';
import '../../../../../../../../core/components/widgets/custom_text_field.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          WelcomeRow(),
          20.toHeight,
          // CustomTextField(
          //   validator: (value) => checkFieldValidation(val: value, fieldName: AppStrings.search, fieldType: fieldType),
          //   hintText: "Search for Posts",
          //   prefixIcon: Icons.search,
          // ),
          45.toHeight,
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder:(context, index) {
              return PostCard();
              },),
          ),
          70.toHeight
        ],
      ).paddingOnly(top: 40.h, left: 20.w, right: 20.w),
    );
  }
}
