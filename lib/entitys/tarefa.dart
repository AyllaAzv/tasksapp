import 'package:tasks/constants/ColorTask.dart';
import 'package:tasks/entitys/entity.dart';

class Tarefa extends Entity {
  int id;
  String titulo;
  String descricao;
  String data;
  ColorTask cor;
  bool fixo;
  int categoria_id;
  int usuario_id;

  Tarefa({
    this.id,
    this.titulo,
    this.descricao,
    this.data,
    this.cor,
    this.fixo,
    this.categoria_id,
    this.usuario_id,
  });

  Tarefa.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    titulo = map['titulo'];
    descricao = map['descricao'];
    data = map['data'];
    cor = map['cor'];
    fixo = map['fixo'];
    categoria_id = map['categoria_id'];
    usuario_id = map['usuario_id'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['data'] = this.data;
    data['cor'] = this.cor;
    data['fixo'] = this.fixo;
    data['categoria_id'] = this.categoria_id;
    data['usuario_id'] = this.usuario_id;
    return data;
  }
}