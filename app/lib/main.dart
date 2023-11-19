import 'package:core/di/di.dart';
import 'package:data/di.dart';
import 'package:domain/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/app/app.dart';
import 'package:presentation/di.dart';

import 'firebase_options.dart';

Future<void> registerApp() async {
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await registerCore(app);
  await registerData();
  await registerDomain();
  await registerPresentation();
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

  await registerApp();

  runApp(
    const MobileApp(),
  );
}
