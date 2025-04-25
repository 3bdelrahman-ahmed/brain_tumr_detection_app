import 'package:bottom_picker/bottom_picker.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/posts_row.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/Slots.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view/widget/days_slots.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view/widget/date_range_selector.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view/widget/slot_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/clinic.dart';
import '../../view_model/slots_cubit.dart';

class SlotsScreen extends StatelessWidget {
  const SlotsScreen({Key? key}) : super(key: key);

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
            slivers: [
              CustomWelcomeAppBar(),
              SliverToBoxAdapter(
                child: state is SlotsLoading
                    ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: CircularProgressIndicator(
                      color: AppColors.buttonsAndNav,
                      strokeWidth: 2.5,
                    ),
                  ),
                )
                    : Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: AppColors.buttonsAndNav.withOpacity(0.3),
                      width: 1.2,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Clinic>(
                      value: cubit.selectedClinic,
                      hint: Text(
                        S.of(context).selectClinic,
                        style: AppTextStyles.font14BlueW500,
                      ),
                      icon: Icon(Icons.keyboard_arrow_down_rounded,
                          color: AppColors.buttonsAndNav),
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      style: AppTextStyles.font15BlackW700,
                      items: cubit.clinics.map((clinic) {
                        return DropdownMenuItem(
                          value: clinic,
                          child: Text(
                            clinic.address,
                            style: AppTextStyles.font16BlueW700,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        cubit.setSelectedClinic(value);
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: DateRangeSelector()),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
              SliverToBoxAdapter(child: DaySelector()),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 7.h)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final slot = cubit.slots[index];
                    return SlotCard(
                      slot: slot,
                      onRemove: () {
                        cubit.removeSlot(index);
                      },
                    );
                  },
                  childCount: cubit.slots.length,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  text: S.of(context).addSlots,
                  onTap: () {
                    showBottomSheet(context, cubit);
                  },
                ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: 80.h)),
            ],
          );
        },
      ),
    );
  }
}
void showBottomSheet(BuildContext context, SlotsCubit cubit) {
  BottomPicker.time(
    pickerTitle:
        Text(S.of(context).setYourDate, style: AppTextStyles.font16BlueW700),
    buttonContent: Center(
        child: Text(
      S.of(context).select,
      style: AppTextStyles.font15WhiteW500,
    )),
    onSubmit: (index){
      print(index);
      cubit.addSlot(index);
    },
    buttonSingleColor: AppColors.buttonsAndNav,
    onCloseButtonPressed: () {
      print('Picker closed');
    },
    use24hFormat: true,
    initialTime: Time(
      hours: 12,
      minutes: 0,
    ),
  ).show(context);
}
