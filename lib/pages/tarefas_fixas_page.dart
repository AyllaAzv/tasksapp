import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks/controller/tarefa_controller.dart';
import 'package:tasks/model/tarefa.dart';
import 'package:tasks/model/usuario.dart';
import 'package:tasks/widgets/tarefa/tarefa_gridview.dart';

class TarefasFixasPage extends StatefulWidget {
  @override
  _TarefasFixasPageState createState() => _TarefasFixasPageState();
}

class _TarefasFixasPageState extends State<TarefasFixasPage> {
  final _model = TarefaController();
  Usuario user = Usuario();

  @override
  void initState() {
    super.initState();

    Future<Usuario> future = Usuario.get();

    future.then((value) {
      user = value;
      _model.getTarefasFixas(user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Observer(builder: (_) {
      List<Tarefa> tarefas = _model.tarefasFixas;

      if (_model.error != null) {
        return Center(
          child: Text(
            "Erro ao carregar tarefas.",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }

      if (tarefas == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: TarefaGridView(tarefas),
      );
    });
  }

  Future<void> _onRefresh() {
    return _model.getTarefasFixas(user.id);
  }
}
