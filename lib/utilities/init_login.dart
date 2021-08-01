import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';

class InitLogin extends StatefulWidget {
  final ValueChanged<UserData> onDone;

  InitLogin({
    required this.onDone,
  });
  @override
  _InitLoginState createState() => _InitLoginState();
}

class _InitLoginState extends State<InitLogin> {
  final _formKey = GlobalKey<FormState>();
  final RegExp _emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  UserData _userData = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getWidget());
  }

  Widget _getWidget() {
    return Center(
      child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  print("OnSaved");
                  print(value);
                  if (value != null) {
                    _userData.name = value;
                  }
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter your email address',
                    labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (!_emailRegex.hasMatch(value ?? "")) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  if (value != null) {
                    _userData.email = value;
                  }
                },
              ),
              TextFormField(
                //key: _passwordFieldKey,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.security),
                  hintText: 'Select your password',
                  labelText: 'Password',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  if (value != null) {
                    _userData.password = value;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("User Data ");
                    print(_userData.name);

                    print("$_userData");
                    _userData.initDone = true;
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    widget.onDone(_userData);
                  }
                },
                child: const Text('SignUp'),
              ),
            ],
          )),
    );
  }
}
