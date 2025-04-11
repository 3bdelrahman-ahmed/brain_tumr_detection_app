import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/strings/app_string.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/gender_container_widget.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectGenderBottomSheet extends StatelessWidget {
  const SelectGenderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RigesterScreenCubit>();
    List<String> genders = [
      AppStrings.male,
      AppStrings.female,
    ];
    return BlocBuilder<RigesterScreenCubit,RigesterScreenState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) => 8.toHeight,
            itemCount: genders.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GenderContainerWidget(
                  isSelected: index == 0
                      ? cubit.isSelectMaleGenders
                      : cubit.isSelectFemaleGenders,
                  gender: genders[index]);
            },
          ),
        );
      },
    );
  }
}
