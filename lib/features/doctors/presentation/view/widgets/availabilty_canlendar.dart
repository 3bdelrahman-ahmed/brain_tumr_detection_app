import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_empty_widget.dart';
import 'package:brain_tumr_detection_app/core/data/models/doctor_clinic_model.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/doctors/data/models/get_slots.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view_model/doctors_cubit.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/available_slots.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';

class DoctorCalendarScreen extends StatefulWidget {
  const DoctorCalendarScreen({Key? key, required this.doctor})
      : super(key: key);

  final DoctorClinicModel doctor;

  @override
  State<DoctorCalendarScreen> createState() => _DoctorCalendarScreenState();
}

class _DoctorCalendarScreenState extends State<DoctorCalendarScreen> {
  int? selectedSlotId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DoctorsCubit>();

    return BlocConsumer<DoctorsCubit, DoctorsState>(
      listener: (context, state) {
        if (state is BookAppointmentSuccess) {
          showBookingConfirmedDialog(context);
        }
      },
      builder: (context, state) {
        return Column(children:[
          // Calendar UI
          Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).availability,
                  style: AppTextStyles.font16BlueW700,
                ).paddingOnly(left: 10.w),
                TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2026, 12, 31),
                  focusedDay: cubit.selectedDay,
                  selectedDayPredicate: (day) =>
                      isSameDay(cubit.selectedDay, day),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    cubit.fetchAvailableSlots(
                      request: AvailablePatientSlotsRequestModel(
                        slotId: widget.doctor.id,
                        date: selectedDay.toString().substring(0, 10),
                      ),
                    );
                    print(selectedDay.toString().substring(0, 10));
                    cubit.selectedDay = selectedDay;
                    setState(() {
                      selectedSlotId = null;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: AppColors.buttonsAndNav,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppColors.typography,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                10.toHeight,
                Text(
                  S.of(context).clickOnTheDayToShow,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font15GreenW500,
                ),
              ],
            ),
          ),

          // Conditional UI
          if (state is GetAvailableDoctorsLoading)
            Container(
              height: 100.h,
              margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // padding: EdgeInsets.symmetric(horizontal: 8.t),
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 16.w),
                  itemBuilder: (context, index) {
                    return CustomAppShimmer(
                      borderRaduis: 8.r,
                    );
                  }),
            )
          else if (state is GetAvailableDoctorsSuccess)
            _buildImprovedTimeSlotsUI(
                context,
                state,
                cubit,
                widget.doctor.doctorFullName ?? widget.doctor.fullName!,
                widget.doctor.address)
          else
            Container(
              height: 50.h,
            ),
        ]);
      },
    );
  }

  Widget _buildImprovedTimeSlotsUI(
      BuildContext context,
      GetAvailableDoctorsSuccess state,
      DoctorsCubit cubit,
      String doctorName,
      String clinic) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for time slots
          Text(
            S.of(context).selectTimeSlot,
            style: AppTextStyles.font16BlueW700,
          ).paddingOnly(bottom: 12.h),
          state.slots.isEmpty
              ? CustomEmptyWidget(
                  title: S.of(context).noAvailableSlotsAtThisDay,
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                  ),
                  itemCount: state.slots.length,
                  itemBuilder: (context, index) {
                    final slot = state.slots[index];
                    final isSelected = selectedSlotId == slot.id;

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedSlotId = slot.id;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              isSelected ? AppColors.typography : Colors.white,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.typography
                                : Colors.grey.shade300,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          slot.startTime ?? "",
                          style: isSelected
                              ? AppTextStyles.font15WhiteW500
                              : AppTextStyles.font16BlueW700,
                        ),
                      ).animate().fadeIn(duration: Duration(milliseconds: 300)),
                    );
                  },
                ),

          if (state.slots.isNotEmpty) 20.toHeight,

          if (state.slots.isNotEmpty)
            CustomButton(
              raduis: 8.r,
              text: S.of(context).bookNow,
              onTap: () {
                if (selectedSlotId != null) {
                  final selectedSlot =
                      state.slots.firstWhere((s) => s.id == selectedSlotId);
                  showDialog(context, selectedSlot, cubit, doctorName, clinic);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).pleaseSelectTimeSlot),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ).paddingOnly(bottom: 16.h).animate().flipV(
                  duration: Duration(milliseconds: 300),
                ),
        ],
      ),
    );
  }
}

void showBookingConfirmedDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Booking Confirmed",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return const SizedBox(); // Required, but unused
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: Text(
            S.of(context).appointmentConfirmed,
            style: AppTextStyles.font16BlueW700,
          ),
          content: Text(
            textAlign: TextAlign.center,
            S.of(context).yourBookingWasSuccessfulSeeYouSoon,
            style: AppTextStyles.font16BlueW700.copyWith(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                S.of(context).confirm,
                style: AppTextStyles.font16BlueW700,
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showDialog(BuildContext context, AvailableSlotsModel selectedSlot,
    DoctorsCubit cubit, String doctorName, String clinic) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Confirm",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return const SizedBox();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedValue = Curves.easeInOut.transform(animation.value);

      return Transform.scale(
        scale: curvedValue,
        child: Opacity(
          opacity: animation.value,
          child: AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            title: Text(
              S.of(context).confirmBooking,
              style: AppTextStyles.font16BlueW700,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).doctor}: ${doctorName}",
                  style: AppTextStyles.font16BlueW700.copyWith(
                    fontSize:
                        14.sp, // Adjusted font size for better readability
                    color: AppColors.black,
                  ),
                ),
                8.toHeight,
                Text(
                  "${S.of(context).date}: ${AppConstants.days[selectedSlot.dayOfWeek!].values.first}",
                  style: AppTextStyles.font16BlueW700.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
                Text("${S.of(context).time}: ${selectedSlot.startTime}",
                    style: AppTextStyles.font16BlueW700.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.black,
                    )),
                Text("${S.of(context).clinic}: ${clinic}",
                    style: AppTextStyles.font16BlueW700.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.black,
                    )),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  S.of(context).cancel,
                  style: AppTextStyles.font12GreenW700,
                ),
              ),
              CustomButton(
                raduis: 8.r,
                text: S.of(context).yesBookNow,
                onTap: () async {
                  Navigator.of(context).pop(); // Close confirmation dialog

                  await cubit.bookAppointment(
                    request: AvailablePatientSlotsRequestModel(
                      slotId: selectedSlot.id!,
                      date: cubit.selectedDay.toString().substring(0, 10),
                    ),
                  );
                },
                textStyle: AppTextStyles.font12WhiteW500,
                width: 120.w,
                height: 50.h,
              ),
            ],
          ),
        ),
      );
    },
  );
}
