import 'package:flutter/material.dart';

import 'tokens/app_fonts.dart';

/// The app's type scale, expressed as Material 3 [TextTheme] roles.
///
/// Widgets use `context.text.<role>` and never create TextStyles from
/// scratch. New screens pick an existing role; if none fits, the design
/// system (this file) gets a new role — not the screen.
///
/// | Role            | Font / size / weight        | Typical use                        |
/// |-----------------|-----------------------------|------------------------------------|
/// | displayLarge    | Urbanist 60 / 800           | hero alias ("Brave Badger")        |
/// | headlineMedium  | Poppins 32 / 700            | screen hero title ("Join A Room")  |
/// | headlineSmall   | Poppins 24 / 600            | code digits                        |
/// | titleLarge      | Urbanist 20 / 600           | header & empty-state titles        |
/// | titleSmall      | Urbanist 14 / 400           | header subtitle                    |
/// | bodyLarge       | Poppins 18 / 300            | lead paragraph                     |
/// | bodyMedium      | Plus Jakarta 14 / 400       | default body, chat text, inputs    |
/// | bodySmall       | Urbanist 14 / 300           | supporting copy, helper/error text |
/// | labelLarge      | Urbanist 18 / 700           | buttons                            |
/// | labelMedium     | Plus Jakarta 14 / 500       | handles, inline actions            |
/// | labelSmall      | Plus Jakarta 12 / 400       | metadata: time, chips, counters    |
abstract final class AppTextTheme {
  static TextTheme build() => TextTheme(
        displayLarge: AppFonts.heading(
          const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w800,
            height: 0.92,
            letterSpacing: -0.6,
          ),
        ),
        headlineMedium: AppFonts.brand(
          const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, height: 1.2),
        ),
        headlineSmall: AppFonts.brand(
          const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1),
        ),
        titleLarge: AppFonts.heading(
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.2),
        ),
        titleSmall: AppFonts.heading(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2),
        ),
        bodyLarge: AppFonts.brand(
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            height: 24 / 18,
          ),
        ),
        bodyMedium: AppFonts.body(
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 19 / 14,
          ),
        ),
        bodySmall: AppFonts.heading(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, height: 1.4),
        ),
        labelLarge: AppFonts.heading(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, height: 1.2),
        ),
        labelMedium: AppFonts.body(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.2),
        ),
        labelSmall: AppFonts.body(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 16 / 12,
            letterSpacing: 0,
          ),
        ),
      );
}
