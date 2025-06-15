import 'package:brain_tumr_detection_app/core/components/widgets/custom_welcome_row.dart';
import 'package:brain_tumr_detection_app/core/data/models/doctor_clinic_model.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/nb_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:brain_tumr_detection_app/core/utils/theme/text_styles/app_text_styles.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/widgets/doctor_data_widget.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/widgets/reviews_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/get_slots.dart';
import '../../view_model/doctors_cubit.dart';
import '../widgets/availabilty_canlendar.dart';

class DoctorsProfile extends StatefulWidget {
  const DoctorsProfile({super.key, required this.doctorClinicModel});

  final DoctorClinicModel doctorClinicModel;

  @override
  State<DoctorsProfile> createState() => _DoctorsProfileState();
}

class _DoctorsProfileState extends State<DoctorsProfile> {
  late final DoctorsCubit _cubit;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<DoctorsCubit>();
    _cubit.fetchReviews(doctorId: widget.doctorClinicModel.id).then((_) {
      // Fetch available slots for the doctor when the profile is loaded
      print(
          "IDDDD :------------------ ${widget.doctorClinicModel.id}-----------------");
      _cubit.fetchAvailableSlots(
        request: AvailablePatientSlotsRequestModel(
          slotId: widget.doctorClinicModel.clinics?.first.id ??
              widget.doctorClinicModel.id,
          date: DateTime.now().toString().substring(0, 10),
        ),
      );
    });
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DoctorsCubit, DoctorsState>(
        listener: (context, state) {
          if (state is GetAvailableDoctorsSuccess) {
            // Scroll to the bottom when slots are fetched
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            });
          }
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomWelcomeAppBar(),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 40.h)),
            SliverToBoxAdapter(
              child: DoctorDataWidget(
                name: widget.doctorClinicModel.doctorFullName!,
                location: widget.doctorClinicModel.address,
                rating: widget.doctorClinicModel.averageStarRating,
                imageUrl: widget.doctorClinicModel.doctorProfilePicture,
              ).paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
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
                      S.of(context).education,
                      style: AppTextStyles.font16BlueW700,
                    ),
                    6.toHeight,
                    Text(
                      "MBBS, MD in Neurology – University of Cairo",
                      style: AppTextStyles.font12GreenW500,
                    )
                  ],
                ),
              ).paddingSymmetric(horizontal: 19.w),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.h)),
            SliverToBoxAdapter(
              child: ReviewsListWidget(),
            ),
            SliverToBoxAdapter(
              child: DoctorCalendarScreen(
                doctor: widget.doctorClinicModel,
              ),
            )
          ],
        ),
      ),
    );
  }
}
