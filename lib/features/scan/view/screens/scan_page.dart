import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/toast_string_extenstion.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/scan/view/widgets/file_data_row.dart';
import 'package:brain_tumr_detection_app/features/scan/view_model/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ScanCubit>();
    return Scaffold(body: BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            CustomWelcomeAppBar(),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 15.h)),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () => cubit.pickFile(),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: Offset(0, 2))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cubit.file != null
                          ? CustomImageView(
                              height: 175.h,
                              width: double.infinity,
                              file: cubit.file,
                              radius: BorderRadius.circular(8.r),
                            ).animate().flipH(duration: 300.ms)
                          : CustomImageView(
                              svgPath: AssetsSvg.file.toSVG(),
                            ),
                      5.toHeight,
                      Text(
                        S.of(context).uploadYourFileHere,
                        style: AppTextStyles.font15GreenW700,
                      ),
                      5.toHeight,
                      Text(
                        S.of(context).supportedFiles,
                        style: AppTextStyles.font12LightGreenW500,
                      )
                    ],
                  ),
                ).paddingSymmetric(vertical: 20.h, horizontal: 20.w),
              ).animate().moveY(
                    begin: 60,
                    duration: 500.ms,
                    curve: Curves.easeInOut,
                  ),
            ),
            SliverToBoxAdapter(
              child: FileDataRow().paddingSymmetric(vertical: 16.h),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                raduis: 8.r,
                isLoading: state is UploadScanLoadingState,
                text: S.of(context).done,
                onTap: () {
                  if (cubit.file == null) {
                    S.of(context).pleasePickAFileToUpload.showToast();
                    return;
                  }
                  cubit.uploadScan();
                },
              ).paddingSymmetric(horizontal: 30.w),
            )
          ],
        );
      },
    ));
  }
}
