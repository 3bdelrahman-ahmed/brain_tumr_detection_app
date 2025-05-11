import 'package:bloc/bloc.dart';
import 'package:brain_tumr_detection_app/core/data/local_services/hive_caching_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'core/services/notification_service/notification_service.dart';
import 'core/services/service_locator/service_locator.dart';
import 'firebase_options.dart';
import 'foundations/app_constants.dart';
import 'nerutum_app.dart';
import 'observers/bloc_oserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    await FirebaseMessaging.instance.requestPermission();
await PushNotificationService().initialize();
// OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // Initialize with your OneSignal App ID
  // OneSignal.initialize("7befc836-c514-4a94-8039-12b89facdfec");
  // Use this method to prompt for push notifications.
  // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
  // OneSignal.Notifications.requestPermission(false);

  await HiveCachingHelper.initHive();
  await AppConstants.getLanguage();
  startService();
  Bloc.observer = BlocObservers();
  runApp(NeroTumApp());
}
