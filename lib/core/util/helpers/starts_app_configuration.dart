import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../firebase_options.dart';

class StartsAppConfiguration extends GetxService {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    _lockScreenPortrait();
    await _initFirebase();
  }

  void _lockScreenPortrait() => SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
