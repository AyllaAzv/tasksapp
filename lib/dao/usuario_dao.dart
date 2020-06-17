import 'package:tasks/dao/base_dao.dart';
import 'package:tasks/entitys/usuario.dart';

class UsuarioDAO extends BaseDAO<Usuario> {
  @override
  Usuario fromMap(Map<String, dynamic> map) {
    return Usuario.fromMap(map);
  }

  @override
  String get tableName => "usuarios";
}
