import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'http_service.dart';

class BackgroundMessage
{
  static void Function(String) callback;
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  final dynamic data = message.containsKey('data') ?
     message['data'] : message['notification'];

  if (BackgroundMessage.callback != null) //FIXME: not working
    BackgroundMessage.callback(data);
}

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  Stream<String> _refreshTokenStream;
  void Function(String) _callback;

  static NotificationService _instance;
  NotificationService._();

  static NotificationService getInstance()
    => _instance ?? (_instance = new NotificationService._());

  static void setCallback(callback)
  {
    getInstance()._callback = callback;
    BackgroundMessage.callback = callback;
  }

  static void start([callback]) {
    getInstance()._setUpFirebase();
    if (callback != null)
      setCallback(callback);
  }

  _setUpFirebase() {
    _refreshTokenStream = _firebaseMessaging.onTokenRefresh;

    if (Platform.isIOS) _iOSPermission();

    // _firebaseMessaging.getToken().then((token) {
    //   print("token: $token");
    // });

    _refreshTokenStream.listen((token) {
      print("new token: $token");
      postNotificationToken(token);
      //TODO: retirar token no back
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        _execute(message);
      },
      onResume: (Map<String, dynamic> message) async {
        _execute(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        _execute(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
    );
  }

  void _iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  void _execute(Map<String, dynamic> message) {
    print("on message $message");
    if (_callback != null) _callback(message.toString());
  }
}
