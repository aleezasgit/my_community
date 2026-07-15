part of 'notification.dart';

class _ScreenState extends ChangeNotifier {
  // Local list to simulate dynamic UI removals upon accepting/declining requests
  List<Map<String, dynamic>> localTodayNotifications = List.from(todayNotificationsData);
  List<Map<String, dynamic>> localYesterdayNotifications = List.from(yesterdayNotificationsData);

  void handleAcceptRequest(String id, bool isToday) {
    debugPrint('Accepted friend request: $id');
    _removeNotification(id, isToday);
  }

  void handleDeclineRequest(String id, bool isToday) {
    debugPrint('Declined friend request: $id');
    _removeNotification(id, isToday);
  }

  void _removeNotification(String id, bool isToday) {
    if (isToday) {
      localTodayNotifications.removeWhere((item) => item['id'] == id);
    } else {
      localYesterdayNotifications.removeWhere((item) => item['id'] == id);
    }
    notifyListeners();
  }
}