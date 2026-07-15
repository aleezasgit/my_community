part of 'faq.dart';

class _ScreenState extends ChangeNotifier {
  final Set<int> expandedIndices = {};

  void onTileToggled(int index) {
    if (expandedIndices.contains(index)) {
      expandedIndices.remove(index);
    } else {
      expandedIndices.add(index);
    }
    notifyListeners();
  }
}