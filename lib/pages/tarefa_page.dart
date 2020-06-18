import 'package:flutter/material.dart';
import 'package:tasks/dao/categoria_dao.dart';
import 'package:tasks/dao/tarefa_dao.dart';
import 'package:tasks/model/categoria.dart';
import 'package:tasks/model/tarefa.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/utils/alert.dart';
import 'package:tasks/utils/nav.dart';

class TarefaPage extends StatefulWidget {
  Tarefa tarefa = Tarefa();

  TarefaPage(this.tarefa);

  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  Categoria categoria =
      Categoria(estudo: false, pessoal: false, trabalho: false);

  Tarefa get tarefa => widget.tarefa;

  @override
  void initState() {
    super.initState();

    _preencheCampos(tarefa);
  }

  _preencheCampos(Tarefa tarefa) {
    CategoriaDAO().findById(tarefa.categoria_id).then((value) {
      setState(() {
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
          "Detalhes da Tarefa",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _onClickDeletar,
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.all(25),
      children: <Widget>[
        Text(
          tarefa.titulo.toUpperCase(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF23acbc),
          ),
        ),
        SizedBox(height: 10),
        Text(
          tarefa.descricao,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xFF23acbc),
          ),
        ),
        SizedBox(height: 25),
        Text(
          _categorias().toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xFF23acbc),
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: <Widget>[
            Icon(
              Icons.date_range,
              color: Color(0xFF23acbc),
            ),
            SizedBox(width: 6),
            Text(
              tarefa.data,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xFF23acbc),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _categorias() {
    List<String> categorias = [];

    if (categoria.trabalho == true) {
      categorias.add("Trabalho");
    }

    if (categoria.pessoal == true) {
      categorias.add("Pessoal");
    }

    if (categoria.estudo == true) {
      categorias.add("Estudo");
    }

    return categorias;
  }

  _onClickDeletar() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Image.asset("assets/images/logo.png",
                height: 50, color: Colors.black45),
            content: Text("Tem certeza de que deseja deletar esta tarefa?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Sim"),
                onPressed: () async {
                  int idTarefa = await TarefaDAO().delete(tarefa.id);
                  int idCategoria = await CategoriaDAO().delete(categoria.id);

                  if (idTarefa != null && idCategoria != null) {
                    pop(context);
                    push(context, HomePage());
                  } else {
                    alert(context, "Erro ao excluir tarefa! Tente novamente.");
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
