import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_community/configs/configs.dart';

part 'enums.dart';

class SearchField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final String? errorText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputformatters;
  final SearchFieldType type;
  final VoidCallback? onTapAdd;
  final Color? fillColor;
  final double? borderRadius;
  final Color? borderColor;
  final void Function(String?)? onChanged;
  final bool onTapOutside;

  const SearchField({
    super.key,
    required this.name,
    this.controller,
    this.enabled,
    this.initialValue,
    this.suffixIcon,
    this.hint,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.inputformatters,
    this.errorText,
    this.validator,
    this.type = SearchFieldType.primary,
    this.onTapAdd,
    this.fillColor,
    this.borderRadius,
    this.borderColor,
    this.onChanged,
    this.onTapOutside = true,
  });

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(375, 812));

    // ── Resolve error state ─────────────────────────────────────────────
    final fieldState = FormBuilder.of(context)?.fields[widget.name];
    final bool hasError =
        widget.errorText != null || (fieldState?.hasError ?? false);
    final String? errorMessage = widget.errorText ?? fieldState?.errorText;

    // ── Dynamic text color ──────────────────────────────────────────────
    final Color activeTextColor = hasError
        ? AppTheme.of(context).error.main!
        : AppTheme.of(context).text.main!;

    // ── Dynamic shadow ──────────────────────────────────────────────────
    List<BoxShadow> activeShadow = [];
    if (hasError) {
      activeShadow = [
        BoxShadow(
          color: const Color(0x26DF1C41),
          blurRadius: 1,
          spreadRadius: 3,
          offset: const Offset(0, 0),
        ),
      ];
    } else if (_focusNode.hasFocus) {
      activeShadow = [
        BoxShadow(
          color: const Color(0xFF2E2423),
          blurRadius: 1,
          spreadRadius: 3,
          offset: const Offset(0, 0),
        ),
      ];
    }

    return IgnorePointer(
      ignoring: widget.enabled == false || widget.readOnly,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Shadow Wrapper ────────────────────────────────────────────
          Container(
            height: 52.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
              boxShadow: activeShadow,
            ),
            child: FormBuilderTextField(
              name: widget.name,
              controller: widget.controller,
              focusNode: _focusNode,
              inputFormatters: widget.inputformatters,
              enabled: widget.enabled ?? true,
              readOnly: widget.readOnly,
              initialValue: widget.initialValue,
              keyboardType: widget.textInputType,
              style: AppText.b1!.cl(activeTextColor),
              cursorColor: hasError
                  ? AppTheme.of(context).error.main!
                  : AppTheme.of(context).primary.main!,
              onTapOutside: widget.onTapOutside
                  ? (_) => FocusScope.of(context).unfocus()
                  : null,
              validator: widget.validator,
              onChanged: (val) {
                widget.onChanged?.call(val);
                setState(() {});
              },
              decoration: InputDecoration(
                errorText: null,
                errorStyle: const TextStyle(height: 0, fontSize: 0),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 4.w),
                  child: SvgPicture.asset(
                    'assets/svgs/search-normal.svg',
                    width: 16.w,
                    height: 16.h,
                  ),
                ),
                suffixIcon: widget.suffixIcon,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 16.w,
                  minHeight: 16.h,
                ),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 24.w,
                  minHeight: 24.h,
                ),
                filled: true,
                fillColor:
                    widget.fillColor ??
                    AppTheme.of(context).background.shade200,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                hintText: widget.hint ?? 'Search',
                hintStyle: AppText.b1!.cl(activeTextColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 16.r,
                  ),
                  borderSide: BorderSide(
                    color:
                        widget.borderColor ??
                        AppTheme.of(context).lightGrey.main!,
                    width: 0.5.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 16.r,
                  ),
                  borderSide: BorderSide(
                    color:
                        widget.borderColor ??
                        AppTheme.of(context).primary.shade300!,
                    width: 1.w,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 16.r,
                  ),
                  borderSide: BorderSide(
                    color: AppTheme.of(context).error.main!,
                    width: 0.5.w,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 16.r,
                  ),
                  borderSide: BorderSide(
                    color: AppTheme.of(context).error.main!,
                    width: 1.w,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 16.r,
                  ),
                  borderSide: BorderSide(
                    color: AppTheme.of(context).lightGrey.main!,
                    width: 0.5.w,
                  ),
                ),
              ),
            ),
          ),

          // ── Error text rendered OUTSIDE shadow container ───────────────
          if (errorMessage != null) ...[
            Space.yf(6),
            Text(
              errorMessage,
              style: AppText.l2!.cl(AppTheme.of(context).error.main!),
            ),
          ],
        ],
      ),
    );
  }
}
