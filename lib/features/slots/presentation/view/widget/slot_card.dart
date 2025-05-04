import 'package:bottom_picker/bottom_picker.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/widgets/custom_image_view.dart';
import 'package:brain_tumr_detection_app/core/helper/functions/convert_time_slot_function.dart';
import 'package:brain_tumr_detection_app/core/utils/assets/assets_svg.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/image_extentions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/slots/data/model/available_slots.dart';
import 'package:brain_tumr_detection_app/features/slots/presentation/view_model/slots_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class SlotCard extends StatelessWidget {
  final AvailableSlotsModel slot;
  final VoidCallback onRemove;

  const SlotCard({super.key, required this.slot, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SlotsCubit>();
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CustomImageView(svgPath: AssetsSvg.clock.toSVG()),
                  SizedBox(height: 4),
                  Text(
                      // locale: Locale("en"),
                      formatTimeTo24Hour(slot.startTime!),
                      style: AppTextStyles.font10BlueW600),
                ],
              ),
              10.toWidth,
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 6.r,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).newSlot,
                          style: AppTextStyles.font15GreyW500),
                      25.toHeight,
                    ],
                  ),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            end: 20.w,
            bottom: -20.w,
            child: Row(
              children: [
                CustomButton(
                  text: S.of(context).edit,
                  textStyle: AppTextStyles.font12WhiteW500,
                  width: 90.w,
                  height: 40.w,
                  onTap: () {
                    cubit
                        .showTimePicker(
                      context,
                      slot: slot,
                    )
                        .then((v) {
                      if (v != null) {
                        cubit.editSlot(slot.id!, v);
                      }
                    });
                  },
                ),
                10.toWidth,
                CustomButton(
                  text: S.of(context).remove,
                  textStyle: AppTextStyles.font12WhiteW500,
                  width: 90.w,
                  height: 40.w,
                  onTap: onRemove,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showBottomSheet(
    BuildContext context, SlotsCubit cubit, AvailableSlotsModel slot) {
  BottomPicker.time(
    pickerTitle:
        Text(S.of(context).setYourDate, style: AppTextStyles.font16BlueW700),
    onSubmit: (date) {
      cubit.editSlot(slot.id!, date);
    },
    buttonContent: Center(
        child: Text(
      S.of(context).select,
      style: AppTextStyles.font15WhiteW500,
    )),
    buttonSingleColor: AppColors.buttonsAndNav,
    onCloseButtonPressed: () {
      print('Picker closed');
    },
    use24hFormat: true,
    initialTime: Time(
      hours: int.parse(slot.startTime!.split(':')[0]),
      minutes: int.parse(slot.startTime!.split(':')[1]),
    ),
  ).show(context);
}
