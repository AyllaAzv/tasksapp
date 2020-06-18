import 'package:mobx/mobx.dart';
import 'package:tasks/dao/tarefa_dao.dart';
import 'package:tasks/model/tarefa.dart';

part 'tarefa_controller.g.dart';

class TarefaController = TarefaControllerBase with _$TarefaController;

abstract class TarefaControllerBase with Store {
  @observable
  List<Tarefa> tarefas = List<Tarefa>();

  @observable
  List<Tarefa> tarefasFixas = List<Tarefa>();

  @observable
  Exception error;

  @action
  getTarefas(int userId) async {
    try {
      this.tarefas = await TarefaDAO().findByUser(userId);
    } catch (e) {
      print("erro");
      this.error = e;
    }
  }

  @action
  getTarefasFixas(int userId) async {
    try {
      this.tarefasFixas = await TarefaDAO().findByUserAndFixed(userId);
    } catch (e) {
      print("erro");
      this.error = e;
    }
  }
}
