import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Request permissions (iOS)
    NotificationSettings settings = await _fcm.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // Get the token
      String? token = await _fcm.getToken();
      print("FCM Token: $token");

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Received a message while in the foreground!');
        print('Message data: ${message.data}');
        if (message.notification != null) {
          print('Notification: ${message.notification!.title}');
          print('Body: ${message.notification!.body}');
        }
      });

      // Background + terminated state
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('Message opened app: ${message.data}');
      });
    }
  }
}
