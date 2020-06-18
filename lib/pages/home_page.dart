import 'package:flutter/material.dart';
import 'package:tasks/pages/tarefa_form_page.dart';
import 'package:tasks/pages/tarefas_fixas_page.dart';
import 'package:tasks/pages/tarefas_page.dart';
import 'package:tasks/utils/nav.dart';
import 'package:tasks/widgets/drawer_list.dart';

class HomePage extends StatefulWidget {
  int index;

  HomePage({this.index});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get index => widget.index;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    if(index != null) {
      _tabController.index = index;
    }
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
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                "Fixas",
              ),
            ),
            Tab(
              child: Text(
                "Outras",
              ),
            ),
          ],
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
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        TarefasFixasPage(),
        TarefasPage(),
      ],
    );
  }
}
