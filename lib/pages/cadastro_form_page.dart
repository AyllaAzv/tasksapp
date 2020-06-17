import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasks/utils/alert.dart';
import 'package:tasks/widgets/app_button.dart';
import 'package:tasks/widgets/app_text.dart';

class CadastroFormPage extends StatefulWidget {
  @override
  _CadastroFormPageState createState() => _CadastroFormPageState();
}

class _CadastroFormPageState extends State<CadastroFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _tNome = TextEditingController();

  final _tEmail = TextEditingController();

  final _tSenha = TextEditingController();

  final _tConfirmacaoSenha = TextEditingController();

  File _file;

  var _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cadastre-se",
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          _headerFoto(),
          SizedBox(
            height: 10,
          ),
          AppText(
            "Nome",
            "Digite um nome",
            icon: Icon(Icons.person),
            controller: _tNome,
            validator: _validateNome,
          ),
          AppText(
            "E-mail",
            "Digite um e-mail",
            icon: Icon(Icons.mail),
            controller: _tEmail,
            validator: _validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          AppText(
            "Senha",
            "Digite uma senha",
            password: true,
            icon: Icon(Icons.lock),
            controller: _tSenha,
            validator: _validateSenha,
          ),
          AppText(
            "Confirmar Senha",
            "Confirme sua senha",
            password: true,
            icon: Icon(Icons.lock),
            controller: _tConfirmacaoSenha,
            validator: _validateConfirmacaoSenha,
          ),
          SizedBox(height: 30),
          AppButton(
            "Criar Conta",
            showProgress: _showProgress,
            onPressed: _onClickCadastro,
          ),
        ],
      ),
    );
  }

  _headerFoto() {
    return InkWell(
      onTap: _onClickFoto,
      child: _file != null
          ? Image.file(
              _file,
              height: 200,
              fit: BoxFit.cover,
            )
          : Image.asset(
              "assets/images/sem-imagem.png",
              height: 200,
            ),
    );
  }

  void _onClickFoto() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        _file = file;
      });
    }
  }

  _onClickCadastro() async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    setState(() {
      _showProgress = true;
    });

    String nome = _tNome.text;
    String email = _tEmail.text;
    String senha = _tSenha.text;
    String confirmacaoSenha = _tConfirmacaoSenha.text;
    String foto = "";

    if (senha != confirmacaoSenha) {
      alert(context, "As senhas não conferem.");
      return;
    }
//
//    final response = await UsuarioService.cadastrar(usuario, senha);
//
//    setState(() {
//      _showProgress = false;
//    });
//
//    if (response.ok) {
//      push(context, LoginPage(), replace: true);
//    } else {
//      alert(context, response.msg);
//    }
  }

  String _validateNome(String text) {
    if (text.isEmpty) {
      return "Digite o nome";
    }
    return null;
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

  String _validateConfirmacaoSenha(String text) {
    if (text.isEmpty) {
      return "Digite a confirmação de senha";
    }

    if (text.length < 3) {
      return "A senha deve ter pelo menos três números";
    }
    return null;
  }
}
