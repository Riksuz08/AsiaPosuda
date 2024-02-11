import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/auth_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/register/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/http_service.dart';
import '../../bloc/main/main_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

  void navigateToHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.read<MainBloc>().add(const MainEventChanged(BottomMenu.profile));
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HttpService httpService = HttpService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = '+998';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.grey.shade50,
          backgroundColor: Colors.white,
          title: Text(
            context.tr('login'),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: context.tr('phone_number'),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (!RegExp(r'^\+998\d{9}$').hasMatch(value)) {
                        return 'Please enter a valid phone number with prefix +998';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: context.tr('password'),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _emailController.text =
                            'email${_emailController.text.replaceAll('+', '')}@gmail.com';
                        try {
                          final bool loginSuccess = await httpService.loginUser(
                            _emailController,
                            _passwordController,
                          );

                          if (loginSuccess) {
                            // Close the current page upon successful login
                            navigateToHome();
                            await _saveData();
                            await httpService.getUser(_emailController.text);
                          } else {
                            // Handle unsuccessful login (show an error message, etc.)
                            print(
                                'Login failed. Please check your credentials.');
                          }
                        } catch (error) {
                          // Handle network or other errors
                          print('Error: $error');
                        }

                        print('Email: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF79B531),
                      // Set the background color here
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      context.tr('login'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Создать новый аккаунт?  '),
                      GestureDetector(
                        onTap: () {
                          // Navigate to another screen when the text is clicked
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          context.tr('register'),
                          style: TextStyle(color: Color(0xFF79B531)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
