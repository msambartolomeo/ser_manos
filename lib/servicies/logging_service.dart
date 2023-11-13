import 'package:firebase_analytics/firebase_analytics.dart';

class LoggingService {
  //**
  //  For debbuging logs with android adb:
  //
  //  with Debugview in firebase:
  //
  //  Android:
  //  adb shell setprop debug.firebase.analytics.app PACKAGE_NAME
  //
  //  To disable: adb shell setprop debug.firebase.analytics.app .none.
  //
  //  With local FirebaseAnalytics logs on android device:
  //  Run:
  //    adb shell setprop log.tag.FA VERBOSE
  //    adb shell setprop log.tag.FA-SVC VERBOSE
  //    adb logcat -v time -s FA FA-SVC
  //
  // */

  final FirebaseAnalytics firebaseAnalytics;

  LoggingService({required this.firebaseAnalytics});

  bool _eventTrackingFlag = true;

  void disableEventTracking() {
    _eventTrackingFlag = false;
  }

  Future<void> log(String name, params) async {
    return _eventTrackingFlag ? await firebaseAnalytics.logEvent(name: name, parameters: params) : null;
  }

  Future<void> logOpenVolunteering(String volunteeringId) async {
    await log("select_content",
        {"content_type": "volunteering", "content_id": volunteeringId});
  }

  Future<void> logApply(String volunteeringId) async {
    await log("join_group", {
      "group_id": volunteeringId,
    });
  }

  Future<void> logDropout(String volunteeringId) async {
    await log("dropout_volunteering", {
      "volunteering_id": volunteeringId,
      "action": "dropout",
    });
  }

  Future<void> logOpenNews(String newsId) async {
    await log("select_content", {
      "content_type": "news",
      "content_id": newsId,
    });
  }

  Future<void> logCreateUser(String uid) async {
    await log("sign_up", {
      "method": "firebase",
    });
  }
}
