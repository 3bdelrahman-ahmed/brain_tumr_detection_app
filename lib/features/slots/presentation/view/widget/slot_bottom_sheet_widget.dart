import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/overrides_curpentino_localization.dart';
import '../../../../../core/helper/functions/convert_time_slot_function.dart';
import '../../../../../core/utils/theme/text_styles/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/model/available_slots.dart';

class SlotBottomSheetWidget extends StatefulWidget {
  final AvailableSlotsModel? slot;

  const SlotBottomSheetWidget({super.key, this.slot});

  @override
  State<SlotBottomSheetWidget> createState() => _SlotBottomSheetWidgetState();
}

class _SlotBottomSheetWidgetState extends State<SlotBottomSheetWidget> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.slot != null
        ? parse24HourTime(widget.slot!.startTime!)
        : TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 300.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              S.of(context).setYourDate,
              style: AppTextStyles.font16BlueW700,
            ),
          ),
          Expanded(
            child: Localizations(
              locale: const Locale('en'),
              delegates: const [
                DefaultWidgetsLocalizations.delegate,
                DefaultMaterialLocalizations.delegate,
                EnglishCupertinoLocalizationsDelegate(), // Force English numerals only for Cupertino
              ],
              child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: Duration(
                    hours: selectedTime.hour,
                    minutes: selectedTime.minute,
                  ),
                  onTimerDurationChanged: (Duration duration) {
                    final hours = duration.inMinutes ~/ 60;
                    final minutes = duration.inMinutes % 60;

                    setState(() {
                      selectedTime = TimeOfDay(hour: hours, minute: minutes);
                    });
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: CustomButton(
              height: 50.h,
              width: 70.w,
              raduis: 8.r,
              onTap: () {
                print(
                    "Selected time: ${selectedTime.hour}:${selectedTime.minute}");
                Navigator.of(context).pop(selectedTime);
              },
              text: S.of(context).select,
            ),
          ),
        ],
      ),
    );
  }
}
