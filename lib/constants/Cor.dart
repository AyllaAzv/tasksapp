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
      return 'ffffff';
    case CorEnum.VERDE:
      return 'befc92';
      break;
    case CorEnum.AMARELO:
      return 'fafc92';
      break;
  }
}

CorEnum corEnum(String cor) {
  if(CorEnum.PADRAO.toString() == cor) {
    return CorEnum.PADRAO;
  } else if(CorEnum.AMARELO.toString() == cor) {
    return CorEnum.AMARELO;
  } else {
    return CorEnum.VERDE;
  }
}
