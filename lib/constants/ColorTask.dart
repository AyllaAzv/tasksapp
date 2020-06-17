enum ColorTask {
  PADRAO,
  VERDE,
  AMARELO,
}

extension ColorsExtension on ColorTask {
  String get name {
    switch (this) {
      case ColorTask.PADRAO:
        return 'Padrão';
      case ColorTask.VERDE:
        return 'Verde';
      case ColorTask.AMARELO:
        return 'Amarelo';
        break;
    }
  }

  String get color {
    switch (this) {
      case ColorTask.PADRAO:
        return '#FFF';
      case ColorTask.VERDE:
        return '#99FF99';
        break;
      case ColorTask.AMARELO:
        return '#FF6666';
        break;
    }
  }
}
