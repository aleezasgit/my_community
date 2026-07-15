part of 'profile_settings.dart';


class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();
  String selectedCountryCode = '+966';

  void updateCountryCode(String code) {
    selectedCountryCode = code;
    notifyListeners();
  }

  void handleUpdateAvatar() {
    debugPrint('Trigger image picker pipeline for profile picture');
  }

  void saveProfileInfo(BuildContext context) {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final values = formKey.currentState?.value;
      debugPrint('Validated Profile Form Fields: $values');
      // Send verified payload structure up to backend databases
    }
  }
}