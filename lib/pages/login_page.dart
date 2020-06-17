import 'package:flutter/material.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/utils/nav.dart';
import 'package:tasks/widgets/app_button_login.dart';
import 'package:tasks/widgets/app_text_login.dart';

import 'cadastro_form_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tEmail = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

//  final _model = LoginModel();

  var _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      backgroundColor: Color(0xFF23acbc),
    );
  }

  _body(context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          SizedBox(height: 70),
          Image.asset(
            "assets/images/logo.png",
            height: 70,
          ),
          SizedBox(height: 20),
          AppTextLogin(
            "E-mail",
            "Digite seu e-mail",
            controller: _tEmail,
            validator: _validateEmail,
            nextFocus: _focusSenha,
            keyboardType: TextInputType.emailAddress,
            icon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          AppTextLogin(
            "Senha",
            "Digite sua senha",
            password: true,
            controller: _tSenha,
            validator: _validateSenha,
            focusNode: _focusSenha,
            icon: Icon(
              Icons.https,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: _onClickCadastro,
                child: Text(
                  "Não tem cadastro?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          AppButtonLogin("Entrar", showProgress: _showProgress, onPressed: _onClickLogin),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/gmail.png",
                    height: 50,
                  )),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/facebook.png",
                    height: 50,
                  )),
              SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/twitter.png",
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future _onClickLogin() async {
    push(context, HomePage(), replace: true);
//    bool formOk = _formKey.currentState.validate();
//
//    if (!formOk) {
//      return;
//    }
//
//    setState(() {
//      _showProgress = true;
//    });
//
//    String usuario = _tUsuario.text;
//    String senha = _tSenha.text;
//
//    await _model.login(usuario, senha);
//
//    ApiResponse response = _model.response;
//
//    setState(() {
//      _showProgress = false;
//    });
//
//    if (response.ok) {
//      Usuario user = response.result;
//      print(">>> ${user.usuario}");
//      push(context, HomePage(), replace: true);
//    } else {
//      alert(context, response.msg);
//    }
  }

  String _validateEmail(String text) {
    if (text.isEmpty) {
      return "Digite o e-mail";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }

    if (text.length < 3) {
      return "A senha deve ter pelo menos três números";
    }
    return null;
  }

  _onClickCadastro() async {
    push(context, CadastroFormPage());
  }
}
