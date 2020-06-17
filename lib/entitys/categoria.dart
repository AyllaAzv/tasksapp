import 'package:tasks/entitys/entity.dart';

class Categoria extends Entity{
  int id;
  bool estudo;
  bool trabalho;
  bool pessoal;

  Categoria({
    this.id,
    this.estudo,
    this.trabalho,
    this.pessoal,
  });

  Categoria.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    estudo = map['estudo'];
    trabalho = map['trabalho'];
    pessoal = map['pessoal'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['estudo'] = this.estudo;
    data['trabalho'] = this.trabalho;
    data['pessoal'] = this.pessoal;
    return data;
  }
}
