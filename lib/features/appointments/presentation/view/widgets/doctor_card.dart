import 'package:brain_tumr_detection_app/core/helper/functions/show_default_dialog_function.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/features/appointments/data/models/appointments_model.dart';
import 'package:brain_tumr_detection_app/features/appointments/presentation/view_model/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/widgets/custom_button.dart';
import '../../../../../core/components/widgets/custom_image_view.dart';
import '../../../../../core/helper/functions/convert_time_slot_function.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import 'cancel_appointment_dialog_widget.dart';

class DoctorCardAppointment extends StatelessWidget {
  Appointments appointment;
  final int index;

  DoctorCardAppointment(
      {Key? key, required this.appointment, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppointmentCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
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
        children: [
          Row(
            children: [
              Container(
                height: 157.w,
                width: 134.w,
                decoration: BoxDecoration(
                  color: AppColors.buttonsAndNav,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: CustomImageView(
                  url: appointment.doctorProfilePicture,
                  fit: BoxFit.cover,
                ).paddingSymmetric(vertical: 7.h, horizontal: 7.h),
              ),
              15.toWidth,
              Container(
                width: 130.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr: ${appointment.doctorName ?? "Hamdy Abdelfatah"}",
                      style: AppTextStyles.font20GreenW700,
                    ),
                    5.toHeight,
                    Text(
                      appointment.status ?? S.of(context).upComing,
                      style: AppTextStyles.font12LightGreenW500,
                    ),
                    5.toHeight,
                    Text(
                      appointment.date ?? "2023-10-01",
                      style: AppTextStyles.font15LightGreenW500,
                    ),
                    5.toHeight,
                    Text(
                      formatTimeTo24Hour(appointment.startTime ?? "9:00:00"),
                      style: AppTextStyles.font15LightGreenW500,
                    ),
                  ],
                ),
              )
            ],
          ),
          25.toHeight,
          (appointment.status != "Completed" &&
                  appointment.status != "Cancelled")
              ? CustomButton(
                  raduis: 8.r,
                  backgroundColor: AppColors.error,
                  text: S.of(context).cancel,
                  height: 50.h,
                  textStyle: AppTextStyles.font15WhiteW500,
                  onTap: () {
                    showDefaultDialog(
                      context,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        child: BlocProvider.value(
                          value: cubit,
                          child: CancelAppointmentDialogWidget(index: index),
                        ),
                      ),
                    );
                  },
                )
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Expanded(
              //         child: CustomButton(
              //           raduis: 8.r,
              //           backgroundColor: AppColors.error,
              //           text: S.of(context).cancel,
              //           height: 50.h,
              //           textStyle: AppTextStyles.font15WhiteW500,
              //           onTap: () {
              //             showDefaultDialog(
              //               context,
              //               child: Padding(
              //                 padding: EdgeInsets.all(20.r),
              //                 child: CancelAppointmentDialogWidget(index: index),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //       10.toWidth,
              //       Expanded(
              //         child: CustomButton(
              //           backgroundColor: AppColors.typography,
              //           raduis: 8.r,
              //           text: S.of(context).reScheduled,
              //           height: 50.h,
              //           textStyle: AppTextStyles.font15WhiteW500,
              //           onTap: () {},
              //         ),
              //       ),
              //     ],
              //   )
              : Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: appointment.status == "Completed"
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        appointment.status == "Completed"
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: appointment.status == "Completed"
                            ? Colors.green
                            : Colors.red,
                      ),
                      10.toWidth,
                      Text(
                        appointment.status == "Completed"
                            ? S.of(context).appointmentCompleted
                            : S.of(context).appointmentCancelled,
                        style: AppTextStyles.font16BlueW700.copyWith(
                          color: appointment.status == "Completed"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ).paddingOnly(top: 5.h),
    );
  }
}
