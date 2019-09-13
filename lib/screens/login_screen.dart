import 'package:flutter/material.dart';
import 'package:gerenteloja/blocs/login_bloc.dart';
import 'package:gerenteloja/configs/styles.dart';
import 'package:gerenteloja/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.store_mall_directory,
                    color: Colors.pinkAccent,
                    size: 160,
                  ),
                  InputField(
                    icon: Icons.person_outline,
                    hint: 'Usuário',
                    stream: _loginBloc.outEmail,
                    onChanged: _loginBloc.changedEmail,
                  ),
                  InputField(
                    icon: Icons.person_outline,
                    hint: 'Senha',
                    obscure: true,
                    stream: _loginBloc.outPassword,
                    onChanged: _loginBloc.changedPassword,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StreamBuilder<bool>(
                    stream: _loginBloc.outSubmitValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: 50,
                        child: RaisedButton(
                          color: primaryColor,
                          child: Text('Acessar'),
                          onPressed: snapshot.hasData ? _loginBloc.submit : null,
                          disabledColor: primaryColor.withAlpha(140),
                          disabledTextColor: Colors.white.withAlpha(140),
                          textColor: Colors.white,
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
