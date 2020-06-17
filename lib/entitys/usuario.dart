import 'package:tasks/entitys/entity.dart';

class Usuario extends Entity{
  int id;
  String nome;
  String email;
  String senha;
  String foto;

  Usuario({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.foto,
  });

  Usuario.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    email = map['email'];
    senha = map['senha'];
    foto = map['foto'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['foto'] = this.foto;
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