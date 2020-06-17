import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            _header(),
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

  _header() {
    return UserAccountsDrawerHeader(
      accountName: Text(
        'Usuário',
      ),
      accountEmail: Text(
        'usuario@gmail.com',
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://w7.pngwing.com/pngs/896/922/png-transparent-computer-icons-user-profile-profile-miscellaneous-angle-white.png',
        ),
      ),
    );
  }

  _onClickLogout(context) {
//      Usuario.clear();
//      FirebaseService().logout();
//      Navigator.pop(context);
//      push(context, LoginPage(), replace: true);
  }
}
