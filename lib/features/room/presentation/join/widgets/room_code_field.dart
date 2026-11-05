import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/l10n/l10n.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/widgets/animations/shake.dart';
import 'code_slot.dart';

class RoomCodeField extends StatefulWidget {
  const RoomCodeField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.hasError = false,
    this.errorTick = 0,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final bool hasError;
  final int errorTick;

  @override
  State<RoomCodeField> createState() => _RoomCodeFieldState();
}

class _RoomCodeFieldState extends State<RoomCodeField> {
  static const int _length = AppConstants.roomCodeLength;
  static const double _gap = 20.5;
  static const double _dashBottomInset = 4;

  String _previousText = '';

  @override
  void initState() {
    super.initState();
    _previousText = widget.controller.text;
    widget.controller.addListener(_onTextChanged);
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant RoomCodeField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onTextChanged);
      widget.controller.addListener(_onTextChanged);
    }
    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocusChanged);
      widget.focusNode.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  void _onTextChanged() {
    final text = widget.controller.text;
    if (text == _previousText) return; // selection-only change
    _previousText = text;
    setState(() {});
    widget.onChanged(text);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = widget.controller.text;
    final focused = widget.focusNode.hasFocus;

    return Shake(
      trigger: widget.errorTick,
      child: Semantics(
        label: context.l10n.joinCodeFieldLabel,
        value: text,
        textField: true,
        child: GestureDetector(
          onTap: widget.enabled ? widget.focusNode.requestFocus : null,
          child: AnimatedContainer(
            duration: AppDurations.fast,
            height: AppSizes.codeFieldHeight,
            decoration: BoxDecoration(
              color: colors.surfaceHighest,
              borderRadius: AppRadius.lgAll,
              border: Border.all(
                color: widget.hasError
                    ? colors.error.withValues(alpha: 0.6)
                    : focused
                        ? colors.accent.withValues(alpha: 0.25)
                        : Colors.transparent,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(child: _hiddenInput()),
                IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: _dashBottomInset, top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (var i = 0; i < _length; i++) ...[
                          if (i > 0) const SizedBox(width: _gap),
                          CodeSlot(
                            digit: i < text.length ? text[i] : null,
                            isActive:
                                focused && widget.enabled && i == text.length,
                            hasError: widget.hasError,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _hiddenInput() => Opacity(
        opacity: 0,
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          enabled: widget.enabled,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          autocorrect: false,
          enableSuggestions: false,
          showCursor: false,
          maxLength: _length,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(_length),
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          onSubmitted: widget.onSubmitted,
        ),
      );
}
