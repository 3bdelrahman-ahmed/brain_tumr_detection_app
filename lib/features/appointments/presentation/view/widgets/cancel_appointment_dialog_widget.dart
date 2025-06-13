import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/appointment_cubit.dart';

class CancelAppointmentDialogWidget extends StatelessWidget {
  final int index;
  const CancelAppointmentDialogWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.warning,
                color: AppColors.error,
                size: 48.r,
              ),
            ),
            16.toHeight,
            Text(
              textAlign: TextAlign.center,
              S.of(context).areYouSureToCancelAppointment,
              style: AppTextStyles.font20BlueW700,
            ),
            24.toHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    text: S.of(context).cancel,
                    onTap: () => Navigator.of(context).pop(),
                    backgroundColor: AppColors.typography,
                    raduis: 8.r,
                    width: 120.w,
                  ),
                ),
                12.toWidth,
                Expanded(
                  child: CustomButton(
                    isLoading: state is DeleteAppointmentLoadingState,
                    text: S.of(context).confirm,
                    raduis: 8.r,
                    onTap: () {
                      context
                          .read<AppointmentCubit>()
                          .removeAppointment(index, context);
                    },
                    backgroundColor: AppColors.error,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
