class User {
  int id;
  String usuario;
  String senha;

  User({
    this.id,
    this.usuario,
    this.senha,
  });

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    usuario = map['usuario'];
    senha = map['senha'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario'] = this.usuario;
    data['senha'] = this.senha;
    return data;
  }

//  static void clear() {
//    Prefs.setString("user.prefs", "");
//  }

//  void save() {
//    Map map = toMap();
//
//    String json = convert.json.encode(map);
//
//    Prefs.setString("user.prefs", json);
//  }
//
//  static Future<Usuario> get() async {
//    String json = await Prefs.getString("user.prefs");
//
//    if (json.isEmpty) {
//      return null;
//    }
//
//    Map map = convert.json.decode(json);
//
//    return Usuario.fromMap(map);
//  }
}