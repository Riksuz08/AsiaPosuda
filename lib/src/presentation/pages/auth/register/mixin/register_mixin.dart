part of 'package:sample_bloc_mobile/src/presentation/pages/auth/register/register_page.dart';

mixin RegisterMixin on State<RegisterPage> {
  late final TextEditingController _fullNameController =
      TextEditingController();
  late final TextEditingController _bloodGroupController =
      TextEditingController();
  late final TextEditingController _phoneNumberController =
      TextEditingController();
  late final RegisterBloc _bloc = context.read<RegisterBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.close();
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _fullNameController.dispose();
    _bloodGroupController.dispose();
    _phoneNumberController.dispose();
  }

  bool _areRequiredFieldsValidated() {
    if (_fullNameController.text.isEmpty) {
      return false;
    }
    if (_bloodGroupController.text.isEmpty) {
      return false;
    }
    if (_phoneNumberController.text.isEmpty) {
      return false;
    }
    return true;
  }
}
