import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

notificationsInit() {
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // var initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: );
  // var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);

  // notificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectionNotification);
}

Future onSelectionNotification(String payload) {

}