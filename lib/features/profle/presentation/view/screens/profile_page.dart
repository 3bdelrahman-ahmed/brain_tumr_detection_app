import 'package:flutter/material.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/profle/presentation/view/widgets/patient_data_widget.dart';
import '../../../../../core/utils/string/app_string.dart';
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
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: PatientDataWidget().paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: _buildCard(
                title: AppStrings.medicalHistory,
                icon: AssetsSvg.edit.toSVG(),
              ).paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: _buildCard(title: AppStrings.posts)
                  .paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: _buildCard(title: AppStrings.savedPosts)
                  .paddingSymmetric(horizontal: 19.w),
            ),
          ],
        ),
      ),
    );
  }

  // Drawer Widget
  Widget _buildDrawer(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        children: [
          ListTile(
            leading: CustomImageView(
              svgPath: AssetsSvg.settings.toSVG(),
            ),
            title:
                Text(AppStrings.settings, style: AppTextStyles.font16BlueW700),
            onTap: () {
              Navigator.pop(context); // Close Drawer
            },
          ),],
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
}
