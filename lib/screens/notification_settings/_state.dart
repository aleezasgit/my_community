part of 'notification_settings.dart';

class _ScreenState extends ChangeNotifier {
  final Map<String, bool> _settingsStates = {
    'booking': true,
    'community': true,
    'livestream': true,
    'activity': true,
    'group_chats': true,
  };

  bool isEnabled(String settingId) => _settingsStates[settingId] ?? false;

  void toggleSetting(String settingId) {
    if (_settingsStates.containsKey(settingId)) {
      _settingsStates[settingId] = !_settingsStates[settingId]!;
      notifyListeners();
    }
  }
}