// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TarefaController on TarefaControllerBase, Store {
  final _$tarefasAtom = Atom(name: 'TarefaControllerBase.tarefas');

  @override
  List<Tarefa> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(List<Tarefa> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  final _$tarefasFixasAtom = Atom(name: 'TarefaControllerBase.tarefasFixas');

  @override
  List<Tarefa> get tarefasFixas {
    _$tarefasFixasAtom.reportRead();
    return super.tarefasFixas;
  }

  @override
  set tarefasFixas(List<Tarefa> value) {
    _$tarefasFixasAtom.reportWrite(value, super.tarefasFixas, () {
      super.tarefasFixas = value;
    });
  }

  final _$errorAtom = Atom(name: 'TarefaControllerBase.error');

  @override
  Exception get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$getTarefasAsyncAction =
      AsyncAction('TarefaControllerBase.getTarefas');

  @override
  Future getTarefas(int userId) {
    return _$getTarefasAsyncAction.run(() => super.getTarefas(userId));
  }

  final _$getTarefasFixasAsyncAction =
      AsyncAction('TarefaControllerBase.getTarefasFixas');

  @override
  Future getTarefasFixas(int userId) {
    return _$getTarefasFixasAsyncAction
        .run(() => super.getTarefasFixas(userId));
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas},
tarefasFixas: ${tarefasFixas},
error: ${error}
    ''';
  }
}
