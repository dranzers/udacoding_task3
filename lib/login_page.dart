import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      fillColor: Colors.green, hintText: 'Username'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Username tidak boleh kosong.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.green, hintText: 'Password'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password tidak boleh kosong.';
                    }
                    if (value.length < 6) {
                      return 'Password tidak boleh kurang dari 6 digit';
                    }
                    return null;
                  },
                ),
                Container(
                  color: Colors.green,
                  child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          var username = usernameController.text;
                          var password = passwordController.text;
                          if (username.contains('udacodingid') &&
                              password.contains('udacodingJaya2021')) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()));
                          } else {
                            _key.currentState.showSnackBar(SnackBar(
                                content:
                                    Text('Username dan password tidak cocok')));
                          }
                        }
                      },
                      child:
                          Text('Login', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
