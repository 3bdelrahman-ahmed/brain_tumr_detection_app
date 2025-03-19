import 'dart:io';

import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/utils/string/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../viewmodel/rigester_screen_cubit.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({Key? key, required this.cubit}) : super(key: key);
 final RigesterScreenCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.profileImage, style: AppTextStyles.font15GreenW500),
        10.toHeight,
        Center(
          child: GestureDetector(
            onTap: () => _showImagePickerOptions(context, cubit),
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: AppColors.typographyLowOpacity,
              child: cubit.imagePath != null
                  ? ClipOval(
                      child: CustomImageView(
                        file: File(cubit.imagePath!.path),
                        width: 100.w,
                        height: 100.w,
                      ),
                    )
                  : Icon(
                      Icons.add_a_photo,
                      size: 30,
                      color: AppColors.typography,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

void _showImagePickerOptions(BuildContext context, RigesterScreenCubit cubit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: [
          ListTile(
            leading:
                const Icon(Icons.photo_library, color: AppColors.typography),
            title:
                Text(AppStrings.gallery, style: AppTextStyles.font15GreenW500),
            onTap: () async {
              Navigator.of(context).pop();
              final XFile? image =
                  await cubit.picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                cubit.saveImage(image);
              }
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.photo_camera, color: AppColors.typography),
            title:
                Text(AppStrings.camera, style: AppTextStyles.font15GreenW500),
            onTap: () async {
              Navigator.of(context).pop();
              final XFile? image =
                  await cubit.picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                cubit.saveImage(image);
              }
            },
          ),
        ],
      );
    },
  );
}
