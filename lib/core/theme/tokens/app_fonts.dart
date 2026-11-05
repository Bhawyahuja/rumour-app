import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

/// Font families by role. Swap a family here and the whole app follows.
abstract final class AppFonts {
  /// Large hero titles and code digits (Figma: Poppins).
  static TextStyle brand(TextStyle style) => GoogleFonts.poppins(textStyle: style);

  /// Headings, buttons, supporting copy (Figma: Urbanist).
  static TextStyle heading(TextStyle style) =>
      GoogleFonts.urbanist(textStyle: style);

  /// Running text and UI labels (Figma: Plus Jakarta Sans).
  static TextStyle body(TextStyle style) =>
      GoogleFonts.plusJakartaSans(textStyle: style);
}
