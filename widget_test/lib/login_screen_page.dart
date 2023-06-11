import 'package:flutter/material.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final _formKey = GlobalKey<FormState>();

  String? _email = "";
  String? _password = "";

  String _displayMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Login Screen",
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        key: const ValueKey('email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Enter your email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        key: const ValueKey('password'),
                        obscureText: true,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Enter your password";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                      const SizedBox(height: 60),
                      _displayMessage.isEmpty
                          ? Container()
                          : Text(_displayMessage),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submit,
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: (){},
                        child: const Text('Register'),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }


  void _submit() {
    if(_formKey.currentState?.validate() ?? false){
      _formKey.currentState?.save();
      if(LoginUtils.login(_email, _password)){
        setState(() {
          _displayMessage = "Success";
        });
      }else{
        setState(() {
          _displayMessage = "Failed";
        });
      }
    }
  }
}

class LoginUtils {
  static bool login(String? email, String? password) {
    if (email == 'rabi@gmail.com' && password == 'Rabindra') {
      return true;
    }
    return false;
  }
}

