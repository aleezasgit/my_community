part of 'verify_mobile_number.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();
}
