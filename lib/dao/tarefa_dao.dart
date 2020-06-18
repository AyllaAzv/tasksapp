import 'package:tasks/dao/base_dao.dart';
import 'package:tasks/model/tarefa.dart';

class TarefaDAO extends BaseDAO<Tarefa> {
  @override
  Tarefa fromMap(Map<String, dynamic> map) {
    return Tarefa.fromMap(map);
  }

  @override
  String get tableName => "tarefas";

  Future<List<Tarefa>> findByUser(int userId) {
    return query('select * from tarefas where usuario_id = ? and fixo = 0', [userId]);
  }

  Future<List<Tarefa>> findByUserAndFixed(int userId) {
    return query('select * from tarefas where usuario_id = ? and fixo = 1', [userId]);
  }
}
