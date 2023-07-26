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

  void _registerUser() {
    final String phoneNum =
        _phoneNumberController.text.replaceAll(RegExp('[0-9]'), '');
    _bloc.add(
      UserRegisterEvent(
        additionalProps: {
          'client_name': _fullNameController.text,
          'phone_number': phoneNum,
          'blood_group': _bloodGroupController.text,
          'table_slug': 'clients'
        },
        phoneNumber: phoneNum,
        bloodGroup: _bloodGroupController.text,
        fullName: _fullNameController.text,
      ),
    );
  }
}
