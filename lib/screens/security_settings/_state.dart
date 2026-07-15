part of 'security_settings.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  void saveSecurityChanges(BuildContext context) {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final values = formKey.currentState?.value;
      debugPrint('Validated Security Form Data: $values');
      // Execute backend password modification sequence here
    }
  }
}