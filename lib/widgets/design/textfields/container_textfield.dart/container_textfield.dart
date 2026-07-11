// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:my_community/configs/configs.dart';

// part 'enums.dart';

// class AppContainerTextField extends StatefulWidget {
//   final String name;
//   final String? hint;
//   final String? label;

//   final int? maxLength;
//   final int maxLines;
//   final bool enabled;
//   final bool readOnly;

//   final TextInputType? keyboardType;
//   final TextInputAction? textInputAction;
//   final TextCapitalization textCapitalization;

//   final Widget? suffix;
//   final ContainerTextFieldType type;

//   final String? Function(String?)? validator;
//   final void Function(String?)? onChanged;
//   final void Function()? onTap;
//   final bool onTapOutside;

//   const AppContainerTextField({
//     super.key,
//     required this.name,
//     this.hint,
//     this.label,
//     this.maxLength,
//     this.maxLines = 1,
//     this.enabled = true,
//     this.readOnly = false,
//     this.keyboardType,
//     this.textInputAction,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.suffix,
//     this.validator,
//     this.onChanged,
//     this.onTap,
//     this.type = ContainerTextFieldType.primary,
//     this.onTapOutside = true,
//   });

//   @override
//   State<AppContainerTextField> createState() => _AppContainerTextFieldState();
// }

// class _AppContainerTextFieldState extends State<AppContainerTextField> {
//   late FocusNode _focusNode;
//   String _text = '';

//   int get _currentLength => _text.length;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode()..addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     App.init(context);

//     final bool isMultiline =
//         widget.type == ContainerTextFieldType.multiline ||
//         widget.type == ContainerTextFieldType.multilineWithSuffix;

//     final bool hasBottomSuffix =
//         widget.type == ContainerTextFieldType.multilineWithSuffix;

//     final bool isFocused = _focusNode.hasFocus;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.label != null) ...[
//           Text(widget.label!, style: AppText.b1bm),
//           Space.yf(8),
//         ],

//         // ── Glow + gradient border wrapper ───────────────────────────────
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(isMultiline ? 24.r : 40.r),
//             border: isFocused
//                 ? GradientBoxBorder(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.lerp(
//                           AppTheme.c.primaryGradient.startColor.withValues(
//                             alpha: 0.8,
//                           ),
//                           AppTheme.c.primaryGradient.endColor,
//                           0.5,
//                         )!,
//                         AppTheme.c.primaryGradient.endColor,
//                       ],
//                       stops: const [0, 0.3],
//                     ),
//                     width: 1.w,
//                   )
//                 : null,
//             boxShadow: isFocused
//                 ? [
//                     const BoxShadow(
//                       color: Color(0x305988F4),
//                       blurRadius: 1,
//                       spreadRadius: 3,
//                       offset: Offset(0, 0),
//                     ),
//                     const BoxShadow(
//                       color: Color(0x8F8E43EF),
//                       blurRadius: 20.7,
//                       offset: Offset(0, 0),
//                     ),
//                   ]
//                 : [],
//           ),

//           child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 16.w,
//               vertical: isMultiline ? 16.h : 0.h,
//             ),
//             decoration: BoxDecoration(
//               color: AppTheme.c.background.main,
//               borderRadius: BorderRadius.circular(isMultiline ? 24.r : 40.r),
//               border: isFocused
//                   ? Border.all(color: Colors.transparent, width: 0)
//                   : Border.all(color: AppTheme.c.lightGrey.main!, width: 1),
//             ),
//             child: isMultiline
//                 ? Stack(
//                     children: [
//                       // ── Text field ──────────────────────────────────
//                       FormBuilderTextField(
//                         name: widget.name,
//                         focusNode: _focusNode,
//                         enabled: widget.enabled,
//                         readOnly: widget.readOnly,
//                         keyboardType: widget.keyboardType,
//                         textInputAction: widget.textInputAction,
//                         textCapitalization: widget.textCapitalization,
//                         maxLines: widget.maxLines,
//                         maxLength: widget.maxLength,
//                         cursorColor: AppTheme.c.primary.main!,
//                         style: AppText.b1!.cl(AppTheme.c.text.shade800!),
//                         validator: widget.validator,
//                         onTap: widget.onTap,
//                         onChanged: (value) {
//                           setState(() => _text = value ?? '');
//                           widget.onChanged?.call(value);
//                         },
//                         onTapOutside: widget.onTapOutside
//                             ? (_) => FocusScope.of(context).unfocus()
//                             : null,
//                         decoration: InputDecoration(
//                           hintText: widget.hint,
//                           hintStyle: AppText.b1!.cl(AppTheme.c.text.main!),
//                           border: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           counterText: '',
//                           contentPadding: EdgeInsets.only(
//                             bottom: hasBottomSuffix ? 40.h : 30.h,
//                           ),
//                         ),
//                       ),

//                       // ── Character counter ───────────────────────────
//                       if (widget.maxLength != null)
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: Text(
//                             '$_currentLength/${widget.maxLength}',
//                             style: AppText.b1!.cl(
//                               _currentLength >= widget.maxLength!
//                                   ? AppTheme.c.error.main!
//                                   : AppTheme.c.text.main!,
//                             ),
//                           ),
//                         ),

//                       // ── Bottom-right suffix ─────────────────────────
//                       if (hasBottomSuffix && widget.suffix != null)
//                         Positioned(bottom: 0, right: 0, child: widget.suffix!),
//                     ],
//                   )
//                 : Row(
//                     children: [
//                       Expanded(
//                         child: FormBuilderTextField(
//                           name: widget.name,
//                           focusNode: _focusNode,
//                           enabled: widget.enabled,
//                           readOnly: widget.readOnly,
//                           keyboardType: widget.keyboardType,
//                           textInputAction: widget.textInputAction,
//                           textCapitalization: widget.textCapitalization,
//                           maxLines: widget.maxLines,
//                           maxLength: widget.maxLength,
//                           cursorColor: AppTheme.c.primary.main!,
//                           style: AppText.b1!.cl(AppTheme.c.text.shade800!),
//                           validator: widget.validator,
//                           onTap: widget.onTap,
//                           onChanged: widget.onChanged,
//                           onTapOutside: widget.onTapOutside
//                               ? (_) => FocusScope.of(context).unfocus()
//                               : null,
//                           decoration: InputDecoration(
//                             hintText: widget.hint,
//                             hintStyle: AppText.b1!.cl(AppTheme.c.text.main!),
//                             border: InputBorder.none,
//                             enabledBorder: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             counterText: '',
//                             contentPadding: Space.vf(15.5),
//                           ),
//                         ),
//                       ),

//                       if (widget.type == ContainerTextFieldType.withSuffix &&
//                           widget.suffix != null) ...[
//                         Space.xf(8),
//                         widget.suffix!,
//                       ],
//                     ],
//                   ),
//           ),
//         ),
//       ],
//     );
//   }
// }

