part of '../profile_settings.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    // Populate with existing user metadata when available
    return {
      _FormKeys.username: 'Alexandra',
      _FormKeys.phoneNumber: '',
    };
  }
}