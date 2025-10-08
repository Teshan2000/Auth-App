import 'package:auth_app/components/button.dart';
import 'package:auth_app/screens/login.dart';
import 'package:auth_app/services/authService.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  void _register() async{
    final result = await _authService.register(
      _emailController.text, 
      _passController.text,
    );

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful!"))
      );

      Navigator.pushNamed(context, 'login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed!"))
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
              )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
              )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
              )),
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
              )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
              )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
              )),
            ),
          ),
          const SizedBox(height: 15),   
          TextFormField(
            controller: _confirmPassController,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Confirm Password',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.lock_outline),
              prefixIconColor: Colors.blue,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
              )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
              )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
              )),
            ),
          ),
          const SizedBox(height: 20),   
          Button(
            title: 'Register', 
            disable: false, 
            onPressed: () {
              _register();
            }
          ),
        ],
      ),
    );
  }
}