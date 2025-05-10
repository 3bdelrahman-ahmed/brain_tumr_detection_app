import 'package:bottom_picker/bottom_picker.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_app_shimmer.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_drop_down_menu.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view/widget/slot_card.dart';
import 'package:brain_tumr_detection_app/foundations/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/slots_cubit.dart';

class SlotsScreen extends StatefulWidget {
  const SlotsScreen({Key? key}) : super(key: key);

  @override
  State<SlotsScreen> createState() => _SlotsScreenState();
}

class _SlotsScreenState extends State<SlotsScreen> {
  @override
  void initState() {
    fetchClinicData();
    super.initState();
  }

  fetchClinicData() async {
    await context.read<SlotsCubit>().loadCachedClinics();
    context.read<SlotsCubit>().getClinics();
    context.read<SlotsCubit>().getClinicsSlots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SlotsCubit, SlotsState>(
        listener: (context, state) {
          if (state is SlotsListRemoved) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  S.of(context).slotRemoved,
                  style: AppTextStyles.font16BlueW700,
                ),
                backgroundColor: AppColors.background,
                action: SnackBarAction(
                  textColor: AppColors.buttonsAndNav,
                  label: 'Undo',
                  onPressed: () {
                    context.read<SlotsCubit>().undoRemove();
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.watch<SlotsCubit>();
          return CustomScrollView(
            controller: cubit.scrollController,
            slivers: [
              CustomWelcomeAppBar(),
              SliverToBoxAdapter(
                child: CustomDropDownMenu(
                  items: cubit.clinics.map((e) {
                    return e.address;
                  }).toList(),
                  hintText: S.of(context).selectClinic,
                  selectedValue: cubit.selectedClinic?.address ??
                      S.of(context).selectClinic,
                  onItemSelected: (v) {
                    final selectedClinic = cubit.clinics.firstWhere(
                      (clinic) => clinic.address == v,
                    );
                    cubit.setSelectedClinic(selectedClinic);
                    cubit.getClinicsSlots();
                  },
                ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
              ),
              SliverToBoxAdapter(
                child: CustomDropDownMenu(
                    items: AppConstants.days
                        .map((dayMap) => dayMap.values.first)
                        .toList(),
                    hintText: S.of(context).chooseDay,
                    selectedValue:
                        AppConstants.days[cubit.selectedDayIndex].values.first,
                    onItemSelected: (v) {
                      final selectedDay = AppConstants.days.firstWhere(
                        (dayMap) => dayMap.values.first == v,
                      );
                      cubit.setSelectedDayIndex(selectedDay.keys.first);
                      cubit.getClinicsSlots();
                    }).paddingSymmetric(horizontal: 20.w),
              ),
              // SliverToBoxAdapter(child: DateRangeSelector()),
              // SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
              // SliverToBoxAdapter(child: DaySelector()),
              // SliverPadding(padding: EdgeInsets.symmetric(vertical: 7.h)),

              SliverToBoxAdapter(
                child: BlocBuilder<SlotsCubit, SlotsState>(
                  builder: (context, state) {
                    final hasChanges = state is SlotsChangedState
                        ? state.hasChanges
                        : cubit.hasChanges;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            backgroundColor: hasChanges
                                ? AppColors.typography
                                : AppColors.typographyLowOpacity,
                            raduis: 8.r,
                            text: S.of(context).save,
                            onTap: () {
                              // if (cubit.selectedClinic == null) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //         S.of(context).selectClinic,
                              //         style: AppTextStyles.font16BlueW700,
                              //       ),
                              //       backgroundColor: AppColors.background,
                              //     ),
                              //   );
                              //   return;
                              // }
                              // showBottomSheet(context, cubit);
                            },
                          ),
                        ),
                        64.toWidth,
                        Expanded(
                          child: CustomButton(
                            isLoading: state is AddSlotLoadingState,
                            raduis: 8.r,
                            text: S.of(context).addSlots,
                            onTap: () {
                              if (cubit.selectedClinic == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      S.of(context).selectClinic,
                                      style: AppTextStyles.font16BlueW700,
                                    ),
                                    backgroundColor: AppColors.background,
                                  ),
                                );
                                return;
                              }
                              cubit.showTimePicker(context).then((v) {
                                if (v != null) {
                                  cubit.addSlot(v);
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
              ),
              BlocBuilder<SlotsCubit, SlotsState>(
                builder: (context, state) {
                  if (cubit.availableSlots.isEmpty && cubit.isLoadingSlots) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CustomAppShimmer(
                            height: 115.h,
                            borderRaduis: 8.r,
                          ).paddingSymmetric(vertical: 12.h, horizontal: 20.w);
                        },
                        childCount: 8,
                      ),
                    );
                  } else if (cubit.availableSlots.isNotEmpty) {
                    return SliverAnimatedList(
                      key: cubit.listKey,
                      initialItemCount: cubit.availableSlots.length,
                      itemBuilder: (context, index, animation) {
                        final slot = cubit.availableSlots[index];
                        return SizeTransition(
                          sizeFactor: animation,
                          child: SlotCard(
                            slot: slot,
                            onRemove: () {
                              cubit.removeSlot(index);
                            },
                          )
                              .animate()
                              .fadeIn(
                                duration: 200.ms,
                                curve: Curves.easeIn,
                              )
                              .paddingOnly(top: 8.h, bottom: 8.h),
                        );
                      },
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                            "assets/lotties/calendar.json",
                            height: 200.w,
                            width: 200.w,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            S.of(context).noSlotsAvailable,
                            style: AppTextStyles.font16GreenW400
                                .copyWith(color: AppColors.buttonsAndNav),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: 100.h)),
            ],
          );
        },
      ),
    );
  }
}

void showBottomSheet(BuildContext context, SlotsCubit cubit) {
  BottomPicker.time(
    titlePadding: EdgeInsets.only(top: 12.h),
    pickerTitle:
        Text(S.of(context).setYourDate, style: AppTextStyles.font16BlueW700),
    buttonContent: Center(
        child: Text(
      S.of(context).select,
      style: AppTextStyles.font15WhiteW500,
    )),
    onSubmit: (date) {
      print("date: ${DateFormat('hh:mm').format(date).toString()}");
      cubit.addSlot(date);
    },
    buttonSingleColor: AppColors.buttonsAndNav,
    onCloseButtonPressed: () {
      print('Picker closed');
    },
    use24hFormat: true,
    buttonPadding: 8.h,
    initialTime: Time(
      hours: 12,
      minutes: 0,
    ),
  ).show(context);
}
