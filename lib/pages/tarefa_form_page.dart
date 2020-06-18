import 'package:flutter/material.dart';
import 'package:tasks/constants/Cor.dart';
import 'package:tasks/dao/categoria_dao.dart';
import 'package:tasks/dao/tarefa_dao.dart';
import 'package:tasks/model/categoria.dart';
import 'package:tasks/model/tarefa.dart';
import 'package:tasks/model/usuario.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/utils/alert.dart';
import 'package:tasks/utils/nav.dart';
import 'file:///C:/Users/aylla/Documents/workspace/tasks/lib/widgets/forms/app_button.dart';
import 'file:///C:/Users/aylla/Documents/workspace/tasks/lib/widgets/forms/app_datepiker.dart';
import 'package:tasks/widgets/forms/app_text.dart';
import 'package:tasks/widgets/forms/app_textarea.dart';

class TarefaFormPage extends StatefulWidget {
  Tarefa tarefa = Tarefa();

  TarefaFormPage({this.tarefa});

  @override
  _TarefaFormPageState createState() => _TarefaFormPageState();
}

class _TarefaFormPageState extends State<TarefaFormPage> {
  Usuario user = Usuario();
  Categoria categoria =
      Categoria(estudo: false, pessoal: false, trabalho: false);
  CorEnum cor = CorEnum.PADRAO;
  bool fixar = false;

  final _formKey = GlobalKey<FormState>();

  final _tTitulo = TextEditingController();
  final _tDescricao = TextEditingController();
  final _tData = TextEditingController();

  var _showProgress = false;

  Tarefa get tarefa => widget.tarefa;

  @override
  void initState() {
    super.initState();

    Future<Usuario> future = Usuario.get();

    future.then((value) => user = value);

    if (tarefa != null) {
      _preencheCampos(tarefa);
    }
  }

  _preencheCampos(Tarefa tarefa) {
    CategoriaDAO().findById(tarefa.categoria_id).then((value) {
      _tTitulo.text = tarefa.titulo;
      _tDescricao.text = tarefa.descricao;
      _tData.text = tarefa.data;

      setState(() {
        fixar = tarefa.fixo;
        cor = corEnum(tarefa.cor);
        categoria = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tarefa == null ? "Nova Tarefa" : "Editar Tarefa",
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
          AppText(
            'Titulo',
            'Digite um titulo para sua tarefa',
            icon: Icon(Icons.title),
            controller: _tTitulo,
            validator: _validateTitulo,
          ),
          AppTextArea(
            'Descrição',
            'Digite uma descrição para sua tarefa',
            icon: Icon(Icons.description),
            controller: _tDescricao,
            validator: _validateDescricao,
          ),
          AppTextDatePiker(
            "Data",
            "Digite a data de sua tarefa",
            Icon(Icons.date_range),
            controller: _tData,
            validator: _validateData,
          ),
          SizedBox(height: 8),
          _checkbox(),
          Divider(),
          _radioButton(),
          Divider(),
          _switch(),
          SizedBox(height: 15),
          AppButton(
            'Salvar',
            onPressed: _onClickSalvar,
            showProgress: _showProgress,
          ),
        ],
      ),
    );
  }

  _switch() {
    return SwitchListTile(
      title: Text('Importante'),
      value: fixar,
      onChanged: (bool value) {
        setState(() {
          fixar = value;
        });
      },
    );
  }

  _radioButton() {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: CorEnum.PADRAO,
              groupValue: cor,
              onChanged: (CorEnum value) {
                setState(() {
                  cor = value;
                  print(cor);
                });
              },
            ),
            Text(nomeCor(CorEnum.PADRAO))
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: CorEnum.VERDE,
              groupValue: cor,
              onChanged: (CorEnum value) {
                setState(() {
                  cor = value;
                  print(cor);
                });
              },
            ),
            Text(nomeCor(CorEnum.VERDE)),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: CorEnum.AMARELO,
              groupValue: cor,
              onChanged: (CorEnum value) {
                setState(() {
                  cor = value;
                  print(cor);
                });
              },
            ),
            Text(nomeCor(CorEnum.AMARELO)),
          ],
        ),
      ],
    );
  }

  _checkbox() {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              value: categoria.pessoal,
              onChanged: (bool value) {
                setState(() {
                  categoria.pessoal = value;
                });
              },
            ),
            Text('Pessoal')
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: categoria.trabalho,
              onChanged: (bool value) {
                setState(() {
                  categoria.trabalho = value;
                });
              },
            ),
            Text('Trabalho')
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: categoria.estudo,
              onChanged: (bool value) {
                setState(() {
                  categoria.estudo = value;
                });
              },
            ),
            Text('Estudo'),
          ],
        )
      ],
    );
  }

  _onClickSalvar() async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    setState(() {
      _showProgress = true;
    });

    int categoriaId = await CategoriaDAO().save(categoria);

    print(categoria.toMap());

    if (categoriaId == null) {
      setState(() {
        _showProgress = false;
      });

      alert(context, "Erro ao editar tarefa! Tente novamente.");

      return;
    }

    Tarefa t = tarefa ?? Tarefa();

    t.titulo = _tTitulo.text;
    t.descricao = _tDescricao.text;
    t.data = _tData.text;
    t.fixo = fixar;
    t.cor = cor.toString();
    t.categoria_id = categoriaId;
    t.usuario_id = user.id;

    print(t.toMap());

    int tarefaId = await TarefaDAO().save(t);

    setState(() {
      _showProgress = false;
    });

    if (tarefaId != null) {
      _goToHome();
    } else {
      alert(context, "Erro ao editar tarefa! Tente novamente.");
    }
  }

  _goToHome() {
    if (fixar) {
      push(context, HomePage(index: 0), replace: true);
    } else {
      push(context, HomePage(index: 1), replace: true);
    }
  }

  String _validateTitulo(String text) {
    if (text.isEmpty) {
      return "Digite o titulo";
    }
    return null;
  }

  String _validateDescricao(String text) {
    if (text.isEmpty) {
      return "Digite a descrição";
    }
    return null;
  }

  String _validateData(DateTime data) {
    if (data == null) {
      return "Digite a data";
    }

    return null;
  }
}
