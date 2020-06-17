import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks/controller/tarefa_controller.dart';
import 'package:tasks/model/tarefa.dart';
import 'package:tasks/model/usuario.dart';
import 'package:tasks/pages/tarefa_form_page.dart';
import 'package:tasks/utils/nav.dart';
import 'package:tasks/widgets/drawer_list.dart';
import 'package:tasks/widgets/tarefa/tarefa_gridview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _model = TarefaController();
  Usuario user = Usuario();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Future<Usuario> future = Usuario.get();

    future.then((value) {
      user = value;
      _model.getTarefas(user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFececec),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: DrawerList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          push(context, TarefaFormPage());
        },
        label: Text("Nova Tarefa"),
        icon: Icon(Icons.library_add),
      ),
      body: _body(),
    );
  }

  _body() {
    return Observer(builder: (_) {
      List<Tarefa> tarefas = _model.tarefas;

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
    return _model.getTarefas(user.id);
  }
}
