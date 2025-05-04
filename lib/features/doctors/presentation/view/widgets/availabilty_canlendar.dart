import 'package:brain_tumr_detection_app/core/components/widgets/custom_button.dart';
import 'package:brain_tumr_detection_app/core/components/screens/register_screen_location_widget.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';

import '../../../../../core/utils/strings/app_string.dart';
import '../../../../../core/utils/theme/colors/app_colors.dart';
import '../../../../../generated/l10n.dart';

class DoctorCalendarScreen extends StatefulWidget {
  @override
  _DoctorCalendarScreenState createState() => _DoctorCalendarScreenState();
}

class _DoctorCalendarScreenState extends State<DoctorCalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final List<DateTime> _availableDates = [
    DateTime.utc(2025, 3, 17),
    DateTime.utc(2025, 3, 18),
    DateTime.utc(2025, 3, 19),
  ];

  //We Will Take the available Time Slots From Backend It is just A mock
  final Map<DateTime, List<String>> _availableTimeSlots = {
    DateTime.utc(2025, 3, 17): ["03:30 PM", "05:30 PM", "08:00 PM"],
    DateTime.utc(2025, 3, 18): ["10:00 AM", "12:00 PM", "04:00 PM"],
    DateTime.utc(2025, 3, 19): [
      "09:00 AM",
      "01:00 PM",
      "07:00 PM",
      "12:00 PM",
      "11:00 PM",
      "10:00 PM"
    ],
  };

  List<String> _selectedTimeSlots = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                firstDay: DateTime.utc(2025, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: _selectedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState((){
                    _selectedDay = selectedDay;
                    _selectedTimeSlots =
                        _availableTimeSlots[selectedDay] ?? [];
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
                // It makes No Days Will Shown Except that We Write it As Available
                // enabledDayPredicate: (day) {
                //   return _availableDates
                //       .any((availableDate) => isSameDay(day, availableDate));
                // },
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
        // Available Time Slots
        if (_selectedTimeSlots.isNotEmpty)...[
          Container(
            height: 50.h,
            alignment: AlignmentDirectional.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedTimeSlots.length,
              itemBuilder: (context, index) {
                return CustomButton(
                  text: _selectedTimeSlots[index],
                  onTap: () {},
                  width: 70.w,
                  textStyle: AppTextStyles.font15WhiteW500,
                ).paddingSymmetric(horizontal: 10.h);
              },
            ),
          ),
          10.toHeight,
          CustomButton(text: S.of(context).bookNow, onTap: () {})
              .paddingOnly(bottom: 30.h),
        ]
      ],
    );
  }
}
