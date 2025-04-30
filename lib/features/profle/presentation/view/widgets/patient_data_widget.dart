import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class PatientDataWidget extends StatelessWidget {
  const PatientDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageOffset = constraints.maxWidth * 0.14;
        double contentPadding = constraints.maxWidth * 0.08; //For Width
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: imageOffset), // Push text below image
                  Text(
                    AppConstants.user?.fullName ?? "Ali Maalol",
                    style: AppTextStyles.font20GreenW700,
                  ),
                  10.toHeight,
                  _buildDetailsRow(
                      AssetsSvg.locationBlue.toSVG(),
                      S.of(context).location,
                      AppConstants.location ?? "Cairo ,Egypt"),
                  _buildDetailsRow(
                      AssetsSvg.gender.toSVG(),
                      S.of(context).gender,
                      context.read<AppCubit>().isEnglish
                          ? AppConstants.user?.gender
                          : AppConstants.user?.gender == "Male"
                              ? S.of(context).male
                              : S.of(context).female),
                  _buildDetailsRow(
                      AssetsSvg.date.toSVG(),
                      S.of(context).dateOfBirth,
                      AppConstants.user?.dateOfBirth?.substring(0, 10) ??
                          "1980/3/16"),
                ],
              ),
            ),
            PositionedDirectional(
              top: -imageOffset, // Adjust based on screen size
              start: 0,
              end: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 110.w,
                  width: 110.w,
                  child: Center(
                    child: CustomProfileImage(
                      size: 50.w,
                      imageUrl: AppConstants.user?.profilePicture,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailsRow(String icon, String mainText, String? data) {
    return Row(
      children: [
        CustomImageView(svgPath: icon),
        5.toWidth,
        RichText(
          text: TextSpan(
            text: mainText,
            style: AppTextStyles.font12BlueW700,
            children: [
              TextSpan(text: " $data", style: AppTextStyles.font12GreenW700),
            ],
          ),
        )
      ],
    ).paddingSymmetric(vertical: 7.h);
  }
}
