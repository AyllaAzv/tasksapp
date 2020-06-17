import 'package:tasks/dao/base_dao.dart';
import 'package:tasks/model/usuario.dart';

class UsuarioDAO extends BaseDAO<Usuario> {
  @override
  Usuario fromMap(Map<String, dynamic> map) {
    return Usuario.fromMap(map);
  }

  @override
  String get tableName => "usuarios";

  Future<Usuario> login(String email, String senha) {
    List arguments = [email, senha];
    return findByAtributs('select * from usuarios where email = ? and senha = ?', arguments);
  }
}
