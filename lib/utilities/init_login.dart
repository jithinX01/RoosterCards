import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';
import 'package:rooster_cards/utilities/file_storage.dart';
import 'package:rooster_cards/vault/coin_card.dart';

enum LoginState {
  LOGIN,
  SHOW_BONUS,
}

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
  LoginState _loginState = LoginState.LOGIN;
  Timer? _t;

  @override
  void dispose() {
    if (_t != null && _t!.isActive) _t?.cancel();
    super.dispose();
  }

  /*
  final RegExp _emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  */
  UserData _userData = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getWidget());
  }

  Widget _getWidget() {
    switch (_loginState) {
      case LoginState.LOGIN:
        return _getLoginWidget();
      case LoginState.SHOW_BONUS:
        return _getBonusWidget();
      default:
        return Container();
    }
  }

  Widget _getBonusWidget() {
    _t = Timer(Duration(seconds: 5), () {
      widget.onDone(_userData);
    });
    return Container(
      child: CoindCard(
        coins: _userData.coins,
        msg: "Join Bonus",
      ),
    );
  }

  Widget _getLoginWidget() {
    return Container(
        padding: EdgeInsets.only(top: 64, right: 10, left: 10),
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'Name',
                      border: const OutlineInputBorder(),
                    ),
                    onSaved: (String? value) {
                      //rprint("OnSaved");
                      //rprint(value);
                      if (value != null) {
                        _userData.name = value;
                      }
                    },
                    //textAlign: TextAlign.center,
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter name';
                      } else if (value!.length < 2) {
                        return ' minimum 2 characters required';
                      }
                      return null;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                  ),
                  /*
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
                      hintText: 'Give a password',
                      labelText: 'Password',
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter password';
                      } else if (value!.length < 6) {
                        return '6 characters required';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      if (value != null) {
                        _userData.password = value;
                      }
                    },
                  ),
                  */
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //rprint("User Data ");
                        //rprint(_userData.name);

                        //rprint("$_userData");
                        _userData.initDone = true;
                        _userData.coins = 1000;
                        _userData.lastLogin = DateTime.now().toString();
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        /*
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        */

                        saveUserData(_userData).then((v) {
                          setState(() {
                            _loginState = LoginState.SHOW_BONUS;
                          });
                          //widget.onDone(_userData);
                        });
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              )),
        ));
  }
  /*
  Future<void> _saveUserData() async {
    var rfs = RoosterFileStorage("user.data");
    await rfs.fileExist;
    rfs.writeFile(_userData.writeToBuffer());
  }
  */
}
