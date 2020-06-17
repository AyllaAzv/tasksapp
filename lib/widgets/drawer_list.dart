import 'package:flutter/material.dart';
import 'package:tasks/model/usuario.dart';
import 'package:tasks/pages/login_page.dart';
import 'package:tasks/utils/nav.dart';

class DrawerList extends StatelessWidget {
  Future<Usuario> future = Usuario.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: future,
              builder: (context, snapshot) {
                Usuario user = snapshot.data;

                return user != null ?_header(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              subtitle: Text("Ver tarefas"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Mais informações"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.chevron_right),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        user.nome,
      ),
      accountEmail: Text(
        user.email,
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
          user.foto,
        ),
      ),
    );
  }

  _onClickLogout(context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
