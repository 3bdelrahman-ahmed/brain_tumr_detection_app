import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import '../../../../core/components/widgets/custom_image_view.dart';
import '../../../../core/utils/assets/assets_svg.dart';
import '../../../../core/utils/string/app_string.dart';
import '../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../viewmodel/scan_cubit.dart';

class FileDataRow extends StatelessWidget {
  const FileDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ScanCubit>();
    return BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        return Row(
          children: [
            CustomImageView(
              svgPath: AssetsSvg.file.toSVG(),
              height: 30.h,
              width: 30.h,
            ),
            5.toWidth,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: state is ScanFilePicked
                      ? () async {
                          final result = await OpenFile.open(cubit.file?.path,);
                          if (result.type != ResultType.done) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to open file')),
                            );
                          }
                        }
                      : () {},
                  child: Container(
                    width: 180.w,
                    child: Text(
                      state is ScanFilePicked
                          ? cubit.fileName
                          : AppStrings.yourFileName,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.font15GreenW700,
                    ),
                  ),
                ),
                15.toHeight,
                if (state is ScanLoading)
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    width: state.progress * 3.w, // Convert % to width
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: AppColors.smallDetails,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                if (state is ScanLoading)
                  Text(
                    "${state.progress} %",
                    style: AppTextStyles.font15GreenW700,
                  ),
                5.toWidth,
                InkWell(
                  onTap: () => cubit.cancelUpload(),
                  child: CustomImageView(
                    svgPath: AssetsSvg.cancel.toSVG(),
                    width: 20.w,
                    height: 20.w,
                  ),
                ),
              ],
            )
          ],
        ).paddingSymmetric(vertical: 20.h, horizontal: 30.w);
      },
    );
  }
}
