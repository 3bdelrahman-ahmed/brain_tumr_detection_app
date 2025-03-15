import 'package:brain_tumr_detection_app/core/services/service_locator/service_locator.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/colors/app_colors.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/widgets/rigester_screen_widget.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/viewmodel/rigester_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RigesterScreen extends StatelessWidget {
  const RigesterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<RigesterScreenCubit>(),
        child: BlocBuilder<RigesterScreenCubit, RigesterScreenState>(
          builder: (context, state) {
            return RigesterScreenWidget();
          },
        ),
      ),
    );
  }
}
