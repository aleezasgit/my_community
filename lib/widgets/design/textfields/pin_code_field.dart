import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community/configs/configs.dart';

class PinCodeField extends StatefulWidget {
  final int length;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool enabled;
  final bool autofocus;
  final String placeholder;

  const PinCodeField({
    super.key,
    this.length = 6,
    this.controller,
    this.onChanged,
    this.onCompleted,
    this.enabled = true,
    this.autofocus = true,
    this.placeholder = '-',
  });

  @override
  State<PinCodeField> createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<PinCodeField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _ownsController = widget.controller == null;
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleChanged(String value) {
    setState(() {});
    widget.onChanged?.call(value);
    if (value.length == widget.length) {
      widget.onCompleted?.call(value);
      _focusNode.unfocus();
    }
  }

  void _focus() => _focusNode.requestFocus();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final text = _controller.text;
    final activeIndex = text.length;

    return Stack(
      children: [
        // ── Hidden input that captures keystrokes ──────────────────────
        Positioned.fill(
          child: Opacity(
            opacity: 0,
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              autofocus: widget.autofocus,
              keyboardType: TextInputType.number,
              maxLength: widget.length,
              showCursor: false,
              enableInteractiveSelection: false,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(widget.length),
              ],
              onChanged: _handleChanged,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        // ── Visible boxes ──────────────────────────────────────────────
        GestureDetector(
          onTap: widget.enabled ? _focus : null,
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              for (int i = 0; i < widget.length; i++) ...[
                if (i != 0) Space.xf(6),
                Expanded(
                  child: _PinBox(
                    char: i < text.length ? text[i] : widget.placeholder,
                    hasDigit: i < text.length,
                    isActive: _focusNode.hasFocus && i == activeIndex,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _PinBox extends StatelessWidget {
  final String char;
  final bool hasDigit;
  final bool isActive;

  const _PinBox({
    required this.char,
    required this.hasDigit,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Container(
      height: 52.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.background.shade200,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isActive ? theme.primary.main! : theme.lightGrey.main!,
          width: isActive ? 1.5.w : 1.w,
        ),
      ),
      child: Text(char, style: AppText.b2bm!.cl(theme.text.shade800!)),
    );
  }
}
