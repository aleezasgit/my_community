part of 'account_preference.dart';

class _AccountPreferencesScreenState extends State<AccountPreferencesScreen> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  
  final List<AppTab> preferenceTab = const [AppTab(label: 'Gender'),
  AppTab(label: 'Age'),
  AppTab(label: 'Interests')];
  int selectedTabIndex = 0;
  //  final List<AppTab> feedTabs = const [
  //   AppTab(label: 'My Posts'),
  //   AppTab(label: 'Events'),
  //   AppTab(label: 'Saved'),
  //   AppTab(label: 'My Friends'),
  // ];

  void setTabIndex(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  void onSaveChanges() {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState?.value;
      debugPrint('Saved Account Preferences: $formData');
    }
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return _AccountPreferencesBody(this);
  }
}