import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomWelcomeAppBar(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post Input Field
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomProfileImage(
                              imageUrl: AppConstants.user?.profilePicture,
                            ),
                            10.toWidth,
                            Text(
                              S.of(context).post,
                              style: AppTextStyles.font16BlueW700,
                            ),
                          ],
                        ),
                        10.toHeight,
                        TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            fillColor: AppColors.typography,
                            focusColor: AppColors.typography,
                            hintStyle: AppTextStyles.font12GreyW500,
                            hintText: S.of(context).whatIsHappening,
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.toHeight,
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: S.of(context).cancel,
                        onTap: () {},
                        width: 80.w,
                        height: 40.w,
                        backgroundColor: Colors.grey[300],
                        textStyle: AppTextStyles.font12BlueW500,
                      ),
                      CustomButton(
                        text: S.of(context).post,
                        onTap: () {},
                        width: 80.w,
                        height: 40.w,
                        textStyle: AppTextStyles.font12WhiteW500,
                      )
                    ],
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
