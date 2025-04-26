import 'package:brain_tumr_detection_app/core/components/cubits/app_cubit/app_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/config/app_routing.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/profle/presentation/view/widgets/patient_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../viewmodel/settings_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context), // Drawer added
      body: Builder(
        builder: (context) => CustomScrollView(
          slivers: [
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 15.h)),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  // Drawer Menu Button (to open drawer)
                  InkWell(
                    child: CustomImageView(
                      svgPath: AssetsSvg.settings.toSVG(),
                    ),
                    onTap: () => Scaffold.of(context).openDrawer(),
                  ),
                ],
              ).paddingSymmetric(horizontal: 19.w, vertical: 10.h),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 15.h)),
            SliverToBoxAdapter(
              child: PatientDataWidget().paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: _buildCard(
                title: S.of(context).medicalHistory,
                icon: AssetsSvg.edit.toSVG(),
              ).paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: _buildCard(title: S.of(context).posts)
                  .paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: _buildCard(title: S.of(context).savedPosts)
                  .paddingSymmetric(horizontal: 19.w),
            ),
          ],
        ),
      ),
    );
  }

  // Drawer Widget
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width -
          MediaQuery.of(context).size.width * .2,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        children: [
          ListTile(
            leading: CustomImageView(
              svgPath: AssetsSvg.settings.toSVG(),
            ),
            title: Text(S.of(context).settings,
                style: AppTextStyles.font16BlueW700),
            onTap: () {
              Navigator.pop(context); // Close Drawer
            },
          ).paddingSymmetric(vertical: 20.h),
          _buildSettingsRow(title: S.of(context).accountSetting),
          _buildSettingsRow(title: S.of(context).notificationsSettings),
          _buildSettingsRow(title: S.of(context).medicalDataManagement),
          _buildSettingsRow(title: S.of(context).supportFeedback),
          _buildSettingsRow(
              title: S.of(context).language,
              onTap: () => _showLanguageBottomSheet(context)),
          CustomButton(
            text: S.of(context).logOut,
            onTap: () {
              AppConstants.clearLogin();
              Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
            },
            textStyle: AppTextStyles.font16BlueW700,
            backgroundColor: Colors.white,
            width: 130.w,
            raduis: 10.r,
          )
        ],
      ),
    );
  }

  Widget _buildCard({required String title, String? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.font16BlueW700),
          Spacer(),
          if (icon != null) CustomImageView(svgPath: icon),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    final cubit = context.read<AppCubit>();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).chooseLanguage, // Add it to your l10n
                style: AppTextStyles.font16BlueW700,
              ),
              SizedBox(height: 20.h),
              ListTile(
                title: Text('English', style: AppTextStyles.font16BlueW700),
                trailing: AppConstants.langCode
                    ? Icon(Icons.check, color: AppColors.buttonsAndNav)
                    : null,
                onTap: () {
                  cubit.changeLanguage(true);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('العربية', style: AppTextStyles.font16BlueW700),
                trailing: AppConstants.langCode
                    ? null
                    : Icon(Icons.check, color: AppColors.buttonsAndNav),
                onTap: () {
                  cubit.changeLanguage(false);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsRow({required String title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.font16BlueW700,
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.buttonsAndNav,
            ),
          ],
        ),
      ).paddingOnly(bottom: 10.h),
    );
  }
// Widget _buildToggleOption(String label, BuildContext context , bool isOn) {
//   final cubit = context.watch<SettingsCubit>();
//
//   return Padding(
//     padding: EdgeInsets.only(top: 10.h),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: AppTextStyles.font16BlueW700),
//         Switch(
//           value: isOn,
//           activeColor: AppColors.buttonsAndNav,
//           onChanged: (_) {},
//         ),
//       ],
//     ),
//   );
// }
}
