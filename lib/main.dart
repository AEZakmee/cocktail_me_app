import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/di/locator.dart';
import 'app/di/storage.dart';
import 'datasource/config/remote_config.dart';
import 'domain/services/auth_service.dart';
import 'firebase_options.dart';
import 'presentation/app/app.dart';
import 'presentation/app/router.dart';

Future<void> initApp() async {
  await setupStorage();

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator(app);
}

Future<void> initRemoteConfig() async {
  final config = locator<RemoteConfig>();
  await config.init();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );

  await initApp();
  await initRemoteConfig();

  final bool userAuthenticated = locator<Auth>().isAuthenticated;

  runApp(
    MyApp(
      initialRoute: userAuthenticated ? Routes.home : Routes.initial,
    ),
  );
}
