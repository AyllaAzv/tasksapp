import 'package:flutter/material.dart';
import 'package:tasks/pages/tarefa_form_page.dart';
import 'package:tasks/utils/nav.dart';
import 'package:tasks/widgets/drawer_list.dart';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    );
  }
}
