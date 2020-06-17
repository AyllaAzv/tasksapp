enum CorEnum {
  PADRAO,
  VERDE,
  AMARELO,
}

String nomeCor(CorEnum cor) {
  switch (cor) {
    case CorEnum.PADRAO:
      return 'Padrão';
    case CorEnum.VERDE:
      return 'Verde';
    case CorEnum.AMARELO:
      return 'Amarelo';
      break;
  }
}

corHex(CorEnum cor) {
  switch (cor) {
    case CorEnum.PADRAO:
      return '#FFF';
    case CorEnum.VERDE:
      return '#99FF99';
      break;
    case CorEnum.AMARELO:
      return '#FF6666';
      break;
  }
}
