import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menuus_mobile/controllers/user_controller.dart';

class LoginView extends StatelessWidget {
  final user = GetIt.I.get<UserController>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('Login'),
            onPressed: () {
              user.getInfoMundo('gabrielkotecki@gmail.com', '123123123');
              Navigator.pushReplacementNamed(context, '/menu-listing');
            },
          ),
        ),
      ),
    );
  }
}
