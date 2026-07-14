part of 'find_friends.dart';

class _ScreenState extends ChangeNotifier {
  String searchQuery = '';

  void updateSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }
}