import 'package:flutter/material.dart';
import 'package:tasks/widgets/app_button.dart';
import 'package:tasks/widgets/app_datepiker.dart';
import 'package:tasks/widgets/app_text.dart';
import 'package:tasks/widgets/app_textarea.dart';
import 'package:tasks/widgets/checkbox_button.dart';
import 'package:tasks/widgets/radio_button.dart';
import 'package:tasks/widgets/switch_button.dart';

class TarefaFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nova Tarefa",
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        AppText('Titulo', 'Digite um titulo para sua tarefa', icon: Icon(Icons.title),),
        AppTextArea('Descrição', 'Digite uma descrição para sua tarefa', icon: Icon(Icons.description),),
        AppTextDatePiker(
          "Data",
          "Digite a data de sua tarefa",
          Icon(Icons.date_range),
        ),
        SizedBox(height: 8),
        CheckboxButton(),
        Divider(),
        RadioButton(),
        Divider(),
        SwitchButton(),
        SizedBox(height: 15),
        AppButton('Salvar', onPressed: () {}),
      ],
    );
  }
}
