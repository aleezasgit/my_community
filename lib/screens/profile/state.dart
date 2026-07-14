part of 'profile.dart';

class _ScreenState extends ChangeNotifier {
  int selectedTabIndex = 0; // Main Profile Tab index (My Posts = 0, Events = 1, etc.)
  
  // 🚀 Updated: Simple selection trackers for the Friends Sub-Chips
  String activeFriendChip = 'My Friends'; 
  final List<String> friendChips = const ['My Friends', 'Requests'];

  final List<AppTab> feedTabs = const [
    AppTab(label: 'My Posts'),
    AppTab(label: 'Events'),
    AppTab(label: 'Saved'),
    AppTab(label: 'My Friends'),
  ];

  void setTabIndex(int index) {
    if (selectedTabIndex != index) {
      selectedTabIndex = index;
      notifyListeners();
    }
  }

  // 🚀 Updated: Setter for updating selected Chip state
  void setFriendChip(String chipName) {
    if (activeFriendChip != chipName) {
      activeFriendChip = chipName;
      notifyListeners();
    }
  }
}