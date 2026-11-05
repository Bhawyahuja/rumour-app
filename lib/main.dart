import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/app.dart';
import 'core/di/injection.dart';
import 'features/theme/presentation/cubit/theme_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      final binding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: binding);

      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        if (kReleaseMode) debugPrint('FlutterError: ${details.exception}');
      };

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      GoogleFonts.config.allowRuntimeFetching = true;

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await configureDependencies();

      runApp(RumourApp(themeCubit: getIt<ThemeCubit>()));
      FlutterNativeSplash.remove();
    },
    (error, stack) {
      FlutterNativeSplash.remove();
      debugPrint('Uncaught error: $error\n$stack');
    },
  );
}
