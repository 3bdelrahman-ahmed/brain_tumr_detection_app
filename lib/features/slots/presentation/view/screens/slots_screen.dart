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
    onSubmit: (index) {
      cubit.addSlot(index);
    },
    buttonSingleColor: AppColors.buttonsAndNav,
    onCloseButtonPressed: () {
      print('Picker closed');
    },
    initialTime: Time(
      minutes: 23,
    ),
  ).show(context);
}
