import 'dart:convert';
import 'dart:io';

import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_profile_image.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/settings_cubit.dart';

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
            BlocConsumer<SettingsCubit, SettingsState>(
              listener: (context, state) async {
                if (state is UploadProfilePictureSuccessState) {
                  final updatedUser = AppConstants.user!
                    ..profilePicture =
                        context.read<SettingsCubit>().profilePath;
                  print(
                      "Saving to cache: ${jsonEncode(updatedUser.toJson())}");
                  await AppConstants.setUser(updatedUser);
                  await AppConstants.setBiometricUser(updatedUser);
                }
              },
              builder: (context, state) {
                return PositionedDirectional(
                  top: -imageOffset,
                  start: 0,
                  end: 0,
                  child: GestureDetector(
                    onTap: () => _showImagePickerOptions(
                        context, context.read<SettingsCubit>()),
                    child: Container(
                      height: 110.w,
                      width: 110.w,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          state is UploadProfilePictureLoadingState
                              ? SizedBox(
                            width: 100.w,
                            height: 100.w,
                            child: Center(
                              child: const CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonsAndNav),
                              ),
                            ),
                          )

                              : CustomProfileImage(
                                  size: 100.w,
                                  imageUrl: AppConstants.user?.profilePicture,
                                ),
                          PositionedDirectional(
                            start: 100,
                            top: 80,
                            end: 0,
                            child: Container(
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.background,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 18.w,
                                color: AppColors.buttonsAndNav,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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

void _showImagePickerOptions(BuildContext context, SettingsCubit cubit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: [
          ListTile(
            leading:
                const Icon(Icons.photo_library, color: AppColors.typography),
            title: Text(S.of(context).gallery,
                style: AppTextStyles.font15GreenW500),
            onTap: () async {
              Navigator.pop(context);
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                print(pickedFile.name);
                final file = File(pickedFile.path);
                cubit.uploadProfilePicture(file, context);
              }
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.photo_camera, color: AppColors.typography),
            title: Text(S.of(context).camera,
                style: AppTextStyles.font15GreenW500),
            onTap: () async {
              Navigator.pop(context);
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.camera);

              if (pickedFile != null) {
                print(pickedFile.name);
                final file = File(pickedFile.path);
                cubit.uploadProfilePicture(file, context);
              }
            },
          ),
        ],
      );
    },
  );
}
