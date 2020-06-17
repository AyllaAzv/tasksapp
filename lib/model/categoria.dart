import 'package:tasks/model/entity.dart';

class Categoria extends Entity {
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

    if (map['estudo'] == 1) {
      estudo = true;
    } else {
      estudo = false;
    }

    if (map['trabalho'] == 1) {
      trabalho = true;
    } else {
      trabalho = false;
    }

    if (map['pessoal'] == 1) {
      pessoal = true;
    } else {
      pessoal = false;
    }
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
