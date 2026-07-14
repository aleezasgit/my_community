part of 'share_profile.dart';

class _ScreenState extends ChangeNotifier {
  String selectedShareChannel = 'Share'; // Default selected channel

  void selectShareChannel(String channelId) {
    if (selectedShareChannel != channelId) {
      selectedShareChannel = channelId;
      notifyListeners();
    }
  }

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Link copied to clipboard!', style: AppText.b2!.cl(Colors.white)),
        backgroundColor: const Color(0xFF566B4D),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}