import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppIconData {
  chevronLeft(
    '<svg viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" '
    'stroke-linecap="round" stroke-linejoin="round">'
    '<path d="m15 18-6-6 6-6"/></svg>',
  ),
  send(
    '<svg viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" '
    'stroke-linecap="round" stroke-linejoin="round">'
    '<path d="M14.536 21.686a.5.5 0 0 0 .937-.024l6.5-19a.496.496 0 0 0-.635-.635l-19 6.5a.5.5 0 0 0-.024.937l7.93 3.18a2 2 0 0 1 1.112 1.11z"/>'
    '<path d="m21.854 2.147-10.94 10.939"/></svg>',
  ),
  sun(
    '<svg viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" '
    'stroke-linecap="round" stroke-linejoin="round">'
    '<circle cx="12" cy="12" r="4"/><path d="M12 2v2"/><path d="M12 20v2"/>'
    '<path d="m4.93 4.93 1.41 1.41"/><path d="m17.66 17.66 1.41 1.41"/>'
    '<path d="M2 12h2"/><path d="M20 12h2"/><path d="m6.34 17.66-1.41 1.41"/>'
    '<path d="m19.07 4.93-1.41 1.41"/></svg>',
  ),
  moon(
    '<svg viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" '
    'stroke-linecap="round" stroke-linejoin="round">'
    '<path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"/></svg>',
  ),
  clock(
    '<svg viewBox="0 0 24 24" fill="none" stroke="#000" stroke-width="2" '
    'stroke-linecap="round" stroke-linejoin="round">'
    '<circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/></svg>',
  );

  const AppIconData(this.svg);

  final String svg;
}

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon, {super.key, this.size = 24, this.color});

  final AppIconData icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? IconTheme.of(context).color ?? Colors.white;
    return SvgPicture.string(
      icon.svg,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
    );
  }
}
