import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/auth_page.dart';

import '../../../../core/services/http_service.dart';
import '../../../bloc/main/main_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  void navigateToHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.read<MainBloc>().add(const MainEventChanged(BottomMenu.profile));

  }
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
  }
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      shadowColor: Colors.grey.shade50,
      backgroundColor: Colors.white,
      title: Text(
        context.tr('register'),
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
              SizedBox(height: 20,),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(
                  labelText: 'Surname',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none
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
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none
                  ),
                ),
                obscureText: true,
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

                    print('Name: ${_nameController.text}');
                    print('Surname: ${_surnameController.text}');
                    print('Phone Number: ${_phoneController.text}');
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                    try {
                      final bool loginSuccess = await httpService.registerUser(
                          _emailController,
                          _nameController,
                          _surnameController,
                          _passwordController,
                          _phoneController
                      );

                      if (loginSuccess) {
                        // Close the current page upon successful login
                        navigateToHome();
                        await _saveData();
                        await httpService.getUser(_emailController.text);
                      } else {
                        // Handle unsuccessful login (show an error message, etc.)
                        print('Login failed. Please check your credentials.');
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
                  primary: Color(0xFF79B531), // Set the background color here
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  context.tr('register'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    Text('Уже есть аккаунт?  '),

                    GestureDetector(
                      onTap: () {
                        // Navigate to another screen when the text is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AuthPage()),
                        );
                      },
                      child: Text(context.tr('login'), style: TextStyle(color: Color(0xFF79B531)),)
                    )
                  ],
                ),

            ],
          ),
        ),
      ),
    )
  );

}

