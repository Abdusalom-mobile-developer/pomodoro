import 'package:awesome_notifications/awesome_notifications.dart';

class LocalNotification {
  static void requestNotificationPermission() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // Request permission
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  static void showNotification(String message) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        
        id: 10,
        channelKey: 'basic_channel',
        title: 'Pomodoro.',
        body: message,
      ),
    );
  }
}