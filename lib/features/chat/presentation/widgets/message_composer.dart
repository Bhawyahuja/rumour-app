import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumour/core/constants/app_constants.dart';
import 'package:rumour/core/l10n/l10n.dart';

import 'package:rumour/core/theme/theme.dart';

import 'send_button.dart';

class MessageComposer extends StatefulWidget {
  const MessageComposer({super.key, required this.onSend});

  final ValueChanged<String> onSend;

  @override
  State<MessageComposer> createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  static const double _height = AppSizes.inputHeight;

  static const int _counterFrom = AppConstants.maxMessageLength - 100;

  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _canSend = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onChanged)
      ..dispose();
    _focusNode.dispose();
    _canSend.dispose();
    super.dispose();
  }

  void _onChanged() => _canSend.value = _controller.text.trim().isNotEmpty;

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    HapticFeedback.lightImpact();
    widget.onSend(text);
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: AnimatedContainer(
            duration: AppDurations.medium,
            constraints: const BoxConstraints(minHeight: _height),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: AppRadius.pillAll,
            ),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              minLines: 1,
              maxLines: 4,
              maxLength: AppConstants.maxMessageLength,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.send,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (_) => _submit(),
              cursorColor: colors.accent,
              style: context.text.bodyMedium?.copyWith(color: colors.textPrimary),
              buildCounter: (
                context, {
                required currentLength,
                required isFocused,
                maxLength,
              }) =>
                  currentLength < _counterFrom
                      ? null
                      : Text(
                          '${maxLength! - currentLength}',
                          style: context.text.labelSmall
                              ?.copyWith(color: colors.textMuted),
                        ),
              decoration: InputDecoration(
                isCollapsed: true,
                // Vertically centres one line of text inside the pill.
                contentPadding: const EdgeInsets.symmetric(vertical: 11),
                border: InputBorder.none,
                hintText: context.l10n.chatComposerHint,
                hintStyle:
                    context.text.bodyMedium?.copyWith(color: colors.textDisabled),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        ValueListenableBuilder<bool>(
          valueListenable: _canSend,
          builder: (context, canSend, _) =>
              SendButton(enabled: canSend, onPressed: _submit),
        ),
      ],
    );
  }
}
