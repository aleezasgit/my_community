import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community_at_app/configs/configs.dart';

import 'country_code.dart';
import 'country_flag.dart';
import 'phone_number_value.dart';
import 'country_code_selector.dart';

class FormBuilderPhoneCodeField extends StatefulWidget {
  /// Form field key. Required — this is what shows up in the form value map.
  final String name;

  final List<CountryCode> countries;
  final CountryCode initialCountry;
  final PhoneNumberValue? initialValue;

  final FormFieldValidator<PhoneNumberValue>? validator;
  final ValueChanged<PhoneNumberValue?>? onChanged;

  final bool enabled;
  final String? hintText;
  final AutovalidateMode autovalidateMode;

  const FormBuilderPhoneCodeField({
    super.key,
    required this.name,
    required this.countries,
    required this.initialCountry,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.hintText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  State<FormBuilderPhoneCodeField> createState() =>
      _FormBuilderPhoneCodeFieldState();
}

class _FormBuilderPhoneCodeFieldState extends State<FormBuilderPhoneCodeField> {
  late final TextEditingController _controller;
  late PhoneNumberValue _value;

  @override
  void initState() {
    super.initState();
    _value =
        widget.initialValue ?? PhoneNumberValue(country: widget.initialCountry);
    _controller = TextEditingController(text: _value.number);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<PhoneNumberValue>(
      name: widget.name,
      validator: widget.validator,
      initialValue: _value,
      enabled: widget.enabled,
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      builder: (FormFieldState<PhoneNumberValue> field) {
        final current = field.value ?? _value;

        Future<void> openSheet() async {
          final picked = await SelectPhoneCodeSheet.show(
            context,
            countries: widget.countries,
            selected: current.country,
          );
          if (picked != null) {
            final next = current.copyWith(country: picked);
            _value = next;
            field.didChange(next);
          }
        }

        void onNumberChanged(String text) {
          final next = current.copyWith(number: text);
          _value = next;
          field.didChange(next);
        }

        final hasError = field.hasError;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: Space.hf(16),
              decoration: BoxDecoration(
                color: AppTheme.of(context).background.shade200,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: hasError
                      ? AppTheme.of(context).error.main!
                      : AppTheme.of(context).lightGrey.main!,
                  width: 1.w,
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: widget.enabled ? openSheet : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CountryFlag(country: current.country, size: 24),
                        Space.xf(4),
                        Text(current.country.dialCode, style: AppText.b2),
                        Space.xf(4),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20.w,
                          color: const Color(0xFF1E1B16),
                        ),
                      ],
                    ),
                  ),
                  Space.xf(8),

                  Expanded(
                    child: TextField(
                      controller: _controller,
                      enabled: widget.enabled,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[\d\s-]')),
                      ],
                      onChanged: onNumberChanged,
                      style: AppText.b2bm!,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: Space.vf(16),
                        hintText:
                            widget.hintText ?? 'Phone number', // TODO: localize
                        hintStyle: AppText.b2bm!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (hasError) ...[
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  field.errorText!,
                  style: AppText.l1bm!.cl(AppTheme.of(context).error.main!),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
