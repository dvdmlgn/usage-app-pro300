import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

notificationsInit() {
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);

  notificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectionNotification);
}

Future onSelectionNotification(String payload) {
  print(payload);

  return null;
}

showNotification() async {
  var _android = AndroidNotificationDetails('channel Id', 'channel name', 'channel description');
  var _ios = IOSNotificationDetails();
  var _platform = NotificationDetails(_android, _ios);

  await notificationsPlugin.show(0, 'the title of the notification', 'the body of the notification', _platform);
}