part of 'package:sample_bloc_mobile/src/presentation/pages/auth/auth_page.dart';

mixin AuthMixin on State<AuthPage> {
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
