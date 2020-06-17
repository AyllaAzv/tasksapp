import 'package:mobx/mobx.dart';
import 'package:tasks/dao/tarefa_dao.dart';
import 'package:tasks/model/tarefa.dart';

part 'tarefa_controller.g.dart';

class TarefaController = TarefaControllerBase with _$TarefaController;

abstract class TarefaControllerBase with Store {
  @observable
  List<Tarefa> tarefas;

  @observable
  Exception error;

  @action
  getTarefas(int userId) async {
    try {
      this.tarefas = await TarefaDAO().findByUser(userId);
    } catch (e) {
      print(e);
      this.error = e;
    }
  }
}
