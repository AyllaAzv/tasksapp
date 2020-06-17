import 'package:tasks/dao/base_dao.dart';
import 'package:tasks/model/categoria.dart';

class CategoriaDAO extends BaseDAO<Categoria> {
  @override
  Categoria fromMap(Map<String, dynamic> map) {
    return Categoria.fromMap(map);
  }

  @override
  String get tableName => "categorias";
}
