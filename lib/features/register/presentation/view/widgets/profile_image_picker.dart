import 'dart:io';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/components/widgets/custom_upload_image_icon.dart';
import '../../../../../core/utils/assets/assets_svg.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/rigester_screen_cubit.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({Key? key, required this.cubit}) : super(key: key);
  final RigesterScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).profileImage, style: AppTextStyles.font15GreenW500),
        10.toHeight,
        Center(
          child: GestureDetector(
            onTap: () => _showImagePickerOptions(context, cubit),
            child: cubit.profileImage != null
                ? Stack(clipBehavior: Clip.none, children: [
                    ClipOval(
                      child: CustomImageView(
                        file: File(cubit.profileImage!.path),
                        width: 100.w,
                        height: 100.w,
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: -2.w,
                      child: CustomImageView(
                        svgPath: AssetsSvg.uploadImage.toSVG(),
                        width: 40.w,
                        height: 40.w,
                      ),
                    )
                  ]).animate().flipH(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    )
                : CustomUploadImageIcon(),

          
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
            title: Text(S.of(context).gallery,
                style: AppTextStyles.font15GreenW500),
            onTap: () async {
              Navigator.of(context).pop();
              final XFile? image =
                  await cubit.picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                cubit.saveImage(File(image.path));
              }
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.photo_camera, color: AppColors.typography),
            title: Text(S.of(context).camera,
                style: AppTextStyles.font15GreenW500),
            onTap: () async {
              Navigator.of(context).pop();
              final XFile? image =
                  await cubit.picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                cubit.saveImage(File(image.path));
              }
            },
          ),
        ],
      );
    },
  );
}
