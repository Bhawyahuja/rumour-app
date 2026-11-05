import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumour/core/l10n/l10n.dart';
import 'package:rumour/core/theme/app_theme.dart';
import 'package:rumour/core/theme/theme_context.dart';
import 'package:rumour/core/theme/tokens/app_durations.dart';
import 'package:rumour/features/theme/presentation/cubit/theme_cubit.dart';

import 'router/app_router.dart';

class RumourApp extends StatelessWidget {
  const RumourApp({super.key, required this.themeCubit});

  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>.value(
      value: themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          onGenerateTitle: (context) => context.l10n.appName,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          themeAnimationDuration: AppDurations.medium,
          themeAnimationCurve: Curves.easeInOut,
          initialRoute: AppRoutes.join,
          onGenerateRoute: AppRouter.onGenerateRoute,
          builder: (context, child) {
            final theme = Theme.of(context);
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: AppTheme.overlayFor(
                theme.brightness,
                context.colors.background,
              ),
              child: GestureDetector(
                // Tap anywhere outside a field to dismiss the keyboard.
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                behavior: HitTestBehavior.translucent,
                child: child ?? const SizedBox.shrink(),
              ),
            );
          },
        ),
      ),
    );
  }
}
