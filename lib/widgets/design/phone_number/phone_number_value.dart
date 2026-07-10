import 'package:flutter/widgets.dart';

import 'country_code.dart';

/// The value stored in the form for this field.
@immutable
class PhoneNumberValue {
  final CountryCode country;
  final String number; // raw digits the user typed

  const PhoneNumberValue({required this.country, this.number = ''});

  /// Digits only, no spaces/dashes.
  String get sanitized => number.replaceAll(RegExp(r'[\s-]'), '');

  /// E.164-ish: dial code + digits, e.g. +966501234567
  String get fullNumber => '${country.dialCode}$sanitized';

  bool get isEmpty => sanitized.isEmpty;

  PhoneNumberValue copyWith({CountryCode? country, String? number}) =>
      PhoneNumberValue(
        country: country ?? this.country,
        number: number ?? this.number,
      );

  @override
  bool operator ==(Object other) =>
      other is PhoneNumberValue &&
      other.country.isoCode == country.isoCode &&
      other.sanitized == sanitized;

  @override
  int get hashCode => Object.hash(country.isoCode, sanitized);
}

/// Constraints for the phone field. Compose them with [PhoneValidators.compose].
class PhoneValidators {
  const PhoneValidators._();

  static FormFieldValidator<PhoneNumberValue> compose(
    List<FormFieldValidator<PhoneNumberValue>> validators,
  ) {
    return (value) {
      for (final v in validators) {
        final result = v(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static FormFieldValidator<PhoneNumberValue> required({
    String message = 'Phone number is required', // TODO: localize
  }) {
    return (value) => (value == null || value.isEmpty) ? message : null;
  }

  static FormFieldValidator<PhoneNumberValue> minLength(
    int length, {
    String? message,
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return value.sanitized.length < length
          ? (message ?? 'Enter at least $length digits') // TODO: localize
          : null;
    };
  }

  static FormFieldValidator<PhoneNumberValue> maxLength(
    int length, {
    String? message,
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return value.sanitized.length > length
          ? (message ?? 'No more than $length digits') // TODO: localize
          : null;
    };
  }

  static FormFieldValidator<PhoneNumberValue> numeric({
    String message = 'Digits only', // TODO: localize
  }) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return RegExp(r'^\d+$').hasMatch(value.sanitized) ? null : message;
    };
  }
}
