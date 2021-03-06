import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menuus_mobile/controllers/user_controller.dart';
import 'package:menuus_mobile/services/notification_service.dart';
import 'package:menuus_mobile/widgets/call_alert.dart';
import 'package:mobx/mobx.dart';

class LoginView extends StatelessWidget {
  final user = GetIt.I.get<UserController>();
  final style = TextStyle(
    color: Colors.red,
    fontSize: 60,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Text(
                'Menuus',
                style: GoogleFonts.pacifico(textStyle: style),
              ),
              SizedBox(height: 60),
              Observer(
                builder: (_) => TextFormField(
                  initialValue: '',
                  onChanged: (value) => user.formEmail = value,
                  decoration: InputDecoration(labelText: 'Email', hintText: 'Informe seu email'),
                ),
              ),
              Observer(
                builder: (_) => TextFormField(
                  initialValue: '',
                  onChanged: (value) => user.formPassword = value,
                  decoration: InputDecoration(labelText: 'Password', hintText: 'Informe sua senha'),
                ),
              ),
              SizedBox(height: 60),
              Observer(
                builder: (_) {
                  if (user.onLoginFuture.status == FutureStatus.pending) {
                    return CircularProgressIndicator();
                  }
                  return RaisedButton(
                    child: Text('Login'),
                    onPressed: () {
                      handleLogin(context);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleLogin(context) async {
    FocusScope.of(context).unfocus();
    await user.onLogin();
    if (user.userData != null) {
      NotificationService.start();
      Navigator.pushReplacementNamed(context, '/menu-listing');
    }
    else
      Alert.error(context, "Não foi possível realizar o login");
  }
}
