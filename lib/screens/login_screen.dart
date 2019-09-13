import 'package:flutter/material.dart';
import 'package:gerenteloja/blocs/login_bloc.dart';
import 'package:gerenteloja/configs/styles.dart';
import 'package:gerenteloja/screens/home_screen.dart';
import 'package:gerenteloja/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case LoginState.IDLE:
        case LoginState.LOADING:
          break;

        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Erro'),
                    content: Text('Login ou senha inválidos ou acesso negado.'),
                  ));
          break;
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: StreamBuilder<LoginState>(
          initialData: LoginState.LOADING,
          stream: _loginBloc.outState,
          builder: (context, snapshot) {
            print(snapshot.data);
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                ));
              case LoginState.SUCCESS:
              case LoginState.FAIL:
              case LoginState.IDLE:
                return Stack(
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
                                      onPressed: snapshot.hasData
                                          ? _loginBloc.submit
                                          : null,
                                      disabledColor:
                                          primaryColor.withAlpha(140),
                                      disabledTextColor:
                                          Colors.white.withAlpha(140),
                                      textColor: Colors.white,
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
