import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/user_controller.dart';

class LoginView extends StatelessWidget {
  final user = GetIt.I.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Observer(
                builder: (_) => TextField(                  
                  onChanged: (value) => user.formEmail = value,
                  decoration: InputDecoration(labelText: 'Email', hintText: 'Informe seu email',),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => user.formPassword = value,
                  decoration: InputDecoration(labelText: 'Password', hintText: 'Informe sua senha'),
                ),
              ),
              SizedBox(height: 60),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  user.onLogin();
                  Navigator.pushReplacementNamed(context, '/menu-listing');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
