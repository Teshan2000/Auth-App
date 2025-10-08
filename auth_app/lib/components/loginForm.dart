import 'package:auth_app/components/button.dart';
import 'package:auth_app/screens/home.dart';
import 'package:auth_app/services/authService.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void _login() async {
    final result = await _authService.login(
      _emailController.text,
      _passController.text,
    );

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!"))
      );

      Navigator.of(context).pushNamed('home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed!"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email Address',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Colors.blue,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _passController,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.lock_outline),
              prefixIconColor: Colors.blue,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Button(
            title: 'Login', 
            disable: false, 
            onPressed: () {
              _login();
            }
          ),
        ],
      ),
    );
  }
}
