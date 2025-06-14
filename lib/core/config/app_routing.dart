import 'package:brain_tumr_detection_app/core/components/cubits/location_cubit/location_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:brain_tumr_detection_app/core/components/screens/rigester__location__screen.dart';
import 'package:brain_tumr_detection_app/core/data/models/doctor_clinic_model.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/view/screen/chat_list_screen.dart';
import 'package:brain_tumr_detection_app/features/chats/presentation/view/screen/chats_screen.dart';
import 'package:brain_tumr_detection_app/features/contact_us/presentation/view_model/cubit/contact_us_cubit.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view/screens/doctors_profile.dart';
import 'package:brain_tumr_detection_app/features/doctors/presentation/view_model/doctors_cubit.dart';
import 'package:brain_tumr_detection_app/features/edit_profile/presentation/view/screens/edit_profile_screen.dart';
import 'package:brain_tumr_detection_app/features/feed/presentation/view/screens/add_post.dart';
import 'package:brain_tumr_detection_app/features/home/presentation/view/home_page.dart';
import 'package:brain_tumr_detection_app/features/medical_history/data/model/detection_response.dart';
import 'package:brain_tumr_detection_app/features/medical_history/presentation/view/screens/detailed_scan_result_screen.dart';
import 'package:brain_tumr_detection_app/features/medical_history/presentation/view/screens/medical_history_screen.dart';
import 'package:brain_tumr_detection_app/features/medical_history/presentation/view_model/medical_history_cubit.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view/screens/rigester_screen.dart';
import 'package:brain_tumr_detection_app/features/register/presentation/view_model/rigester_screen_cubit.dart';
import 'package:brain_tumr_detection_app/features/reports/data/model/doctor_reports_model.dart';
import 'package:brain_tumr_detection_app/features/reports/presentation/view/screens/view_report_screen.dart';
import 'package:brain_tumr_detection_app/features/reset_password/presentation/view/screens/reset_password.dart';
import 'package:brain_tumr_detection_app/features/verification_code/presentation/view_model/cubit/verification_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/chats/data/models/chat_preview.dart';
import '../../features/contact_us/presentation/view/screens/contact_us_screen.dart';
import '../../features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import '../../features/login/presentation/view/screens/login_screen.dart';
import '../../features/login/presentation/view_model/login_cubit.dart';
import '../../features/notification/presentation/view/screen/notification_screen.dart';
import '../../features/notification/presentation/view_model/cubit/notification_cubit.dart';
import '../../features/onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/view_model/onboarding_cubit.dart';
import '../../features/reset_password/presentation/view_model/reset_password_cubit.dart';
import '../../features/splash/presentation/view/screens/splash_screen.dart';
import '../../features/verification_code/presentation/view/screens/verification_code_screen.dart';
import '../services/service_locator/service_locator.dart';

class AppRoutes {
  static const String splashScreen = "/splash";
  static const String onBoardingScreen = "/onBoarding";
  static const String loginScreen = "/login";
  static const String registerScreen = '/rigester';
  static const String editProfileScreen = '/editProfile';
  static const String locationScreen = '/location';
  static const String homeScreen = '/home';
  static const String verificationCodeScreen = '/verification_code';
  static const String doctorProfileScreen = '/doctorProfile';
  static const String addPostScreen = '/addPost';
  static const String viewReportScreen = '/viewReport';
  static const String chatsScreen = '/chatsScreen';
  static const String chatsListScreen = '/chatsListScreen';
  static const String notificationScreen = '/notification';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String contactUsScreen = '/contactUs';
  static const String medicalHistoryScreen = '/medicalHistory';
  static const String detailedScanResultScreen = '/detailedScanResultScreen';
}

class AppRouter {
  static Route<dynamic> animateRouteBuilder(
    Widget widget, {
    Duration? duration,
  }) {
    return buildPageRoute(widget, duration ?? 300.ms);
  }

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.verificationCodeScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        return animateRouteBuilder(BlocProvider(
          create: (context) => getIt<VerificationCodeCubit>(),
          child: VerificationCodeScreen(
            email: args['email'] as String,
            isResetPass: args['isResetPass'] as bool,
          ),
        ));
      case AppRoutes.notificationScreen:
        return animateRouteBuilder(
          BlocProvider(
            create: (context) => getIt<NotificationCubit>(),
            child: const NotificationScreen(),
          ),
          duration: 300.ms,
        );

      case AppRoutes.detailedScanResultScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        return animateRouteBuilder(
          BlocProvider(
            create: (context) => getIt<MedicalHistoryCubit>(),
            child: DetailedScanResultScreen(
              doctorReview: args["doctorReview"] as DoctorReview,
              detectionClass: args["detectionClass"] as String,
            ),
          ),
          duration: 300.ms,
        );

      case AppRoutes.editProfileScreen:
        return animateRouteBuilder(
          BlocProvider(
            create: (context) => getIt<EditProfileCubit>(),
            child: const EditProfileScreen(),
          ),
          duration: 300.ms,
        );
      case AppRoutes.medicalHistoryScreen:
        return animateRouteBuilder(
          BlocProvider(
            create: (context) => getIt<MedicalHistoryCubit>(),
            child: const MedicalHistoryScreen(),
          ),
          duration: 300.ms,
        );
      case AppRoutes.resetPasswordScreen:
        return animateRouteBuilder(BlocProvider(
          create: (context) => getIt<ResetPasswordCubit>(),
          child: ResetPassword(),
        ));
      case AppRoutes.splashScreen:
        return animateRouteBuilder(
          const SplashScreen(),
          duration: 300.ms,
        );
      case AppRoutes.contactUsScreen:
        return animateRouteBuilder(
          BlocProvider(
            create: (context) => getIt<ContactUsCubit>(),
            child: const ContactUsScreen(),
          ),
          duration: 300.ms,
        );
      case AppRoutes.addPostScreen:
        return animateRouteBuilder(
          const AddPost(),
          duration: 300.ms,
        );
      case AppRoutes.viewReportScreen:
        return animateRouteBuilder(
          ViewReportScreen(
            report: routeSettings.arguments as Report,
          ),
          duration: 300.ms,
        );
      case AppRoutes.chatsScreen:
        return animateRouteBuilder(
          ChatsScreen(chat: routeSettings.arguments as ChatPreview),
        );
      case AppRoutes.chatsListScreen:
        return animateRouteBuilder(ChatListScreen());
      case AppRoutes.onBoardingScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<OnboardingCubit>(),
              child: const OnBoardingScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.loginScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.doctorProfileScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<DoctorsCubit>(),
              child: DoctorsProfile(
                doctorClinicModel: routeSettings.arguments as DoctorClinicModel,
              ),
            ),
            duration: 300.ms);
      case AppRoutes.registerScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<RigesterScreenCubit>(),
              child: const RigesterScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.homeScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<NavigationCubit>(),
              child: HomeScreen(),
            ),
            duration: 300.ms);
      case AppRoutes.locationScreen:
        return animateRouteBuilder(
            BlocProvider(
              create: (context) => getIt<LocationCubit>(),
              child: LocationScreen(),
            ),
            duration: 300.ms);
      default:
        return null;
    }
  }
}

Route buildPageRoute(Widget page, Duration duration) {
  return PageRouteBuilder(
    transitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      /// **Custom animation: Slide from bottom**
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // Start from bottom
          end: Offset.zero, // End at normal position
        ).animate(animation),
        child: child,
      );
    },
  );
}
